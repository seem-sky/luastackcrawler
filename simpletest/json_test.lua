local testlib=assert(require"stackcrawlertest")
package.path=package.path..";../Lua/?/?.lua"
package.cpath=package.cpath..";./?.so"
local json=assert(require"json")

describe("testing libraries are loaded correctly", function()
  assert.is.not_nil(testlib)
  assert.is.not_nil(json)
end)

describe("C++ LuaStackCrawler JSON output", function()
	
	describe("LuaStack wrapper is a greedy wrapper for the lua function call stack", function()

		it("should return simple values",function()
			assert.are.same( {1}  ,( json.decode( stack_to_json(1) ) ) )
			assert.are.same( {1.1},( json.decode( stack_to_json(1.1) ) ) )
			assert.are.same( {"1"},( json.decode( stack_to_json("1") ) ) )
		end)

		describe("the tables are captured, such as the reference nature of lua tables is preserved, but there is no infinite recursion",function()
			local empty_table={}
			local empty_table_representation = { tostring(empty_table) }

			it("should return the table along with a lua-compatible name",function ()
				assert.are.same( { empty_table_representation }, (json.decode( stack_to_json(empty_table))))
				assert.are.same(
					{empty_table_representation,empty_table_representation},
					(json.decode( stack_to_json(empty_table,empty_table)))
				)
			end)

			it("should list the keys and values of the passed table",function()
				local t = { 1 , "2", empty_table }
				local expected = {
					"",
					{ Key = 1, Value = 1},
					{ Key = 2, Value = "2"},
					{ Key = 3, Value = empty_table_representation }
				}
				expected[1] = tostring(t)
				local result = json.decode( stack_to_json ( t ) )
				assert.are.same( { expected },result)
			end)

			it("should be able to handle tables both as keys and as values",function ()
				local t = { }
				t[t] = t
				local s = tostring(t)
				local expected = {
					s,
					{ Key = { s }, Value = { s } }
				}
				assert.are.same ( { expected } , ( json.decode( stack_to_json(t) ) ) ) 
			end)
		end)

	end)

end)