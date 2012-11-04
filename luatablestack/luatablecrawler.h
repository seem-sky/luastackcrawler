#pragma once

#include "luavalue.h"

#include <memory>

struct lua_State;

class TableCrawler {
public:
	TableCrawler(lua_State* L,int p);
public:
	std::shared_ptr<LuaTable> GetTable() const;
private:
	lua_State* L;
	int pos;
	std::shared_ptr<LuaTable> T;
};