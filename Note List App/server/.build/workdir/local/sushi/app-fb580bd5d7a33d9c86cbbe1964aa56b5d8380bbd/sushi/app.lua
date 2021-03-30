app = app or {}

app.NoteListDatabase = {}
app.NoteListDatabase.__index = app.NoteListDatabase
_vm:set_metatable(app.NoteListDatabase, {})

app.NoteListDatabase.NOTE = "note"

function app.NoteListDatabase._create()
	local v = _vm:set_metatable({}, app.NoteListDatabase)
	return v
end

function app.NoteListDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListDatabase'
	self['_isType.app.NoteListDatabase'] = true
	self.db = nil
end

function app.NoteListDatabase:_construct0()
	app.NoteListDatabase._init(self)
	return self
end

app.NoteListDatabase.Note = _g.jk.json.JSONObjectAdapter._create()
app.NoteListDatabase.Note.__index = app.NoteListDatabase.Note
_vm:set_metatable(app.NoteListDatabase.Note, {
	__index = _g.jk.json.JSONObjectAdapter
})

function app.NoteListDatabase.Note._create()
	local v = _vm:set_metatable({}, app.NoteListDatabase.Note)
	return v
end

function app.NoteListDatabase.Note:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListDatabase.Note'
	self['_isType.app.NoteListDatabase.Note'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._id = nil
	self._name = nil
	self._description = nil
	self._timeStampAdded = nil
	self._timeStampLastUpdated = nil
end

function app.NoteListDatabase.Note:_construct0()
	app.NoteListDatabase.Note._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function app.NoteListDatabase.Note:setId(value)
	self._id = value
	do return self end
end

function app.NoteListDatabase.Note:getId()
	do return self._id end
end

function app.NoteListDatabase.Note:setName(value)
	self._name = value
	do return self end
end

function app.NoteListDatabase.Note:getName()
	do return self._name end
end

function app.NoteListDatabase.Note:setDescription(value)
	self._description = value
	do return self end
end

function app.NoteListDatabase.Note:getDescription()
	do return self._description end
end

function app.NoteListDatabase.Note:setTimeStampAddedValue(value)
	do return self:setTimeStampAdded(_g.jk.lang.LongInteger:asObject(value)) end
end

function app.NoteListDatabase.Note:getTimeStampAddedValue()
	do return _g.jk.lang.LongInteger:asLong(self._timeStampAdded) end
end

function app.NoteListDatabase.Note:setTimeStampAdded(value)
	self._timeStampAdded = value
	do return self end
end

function app.NoteListDatabase.Note:getTimeStampAdded()
	do return self._timeStampAdded end
end

function app.NoteListDatabase.Note:setTimeStampLastUpdatedValue(value)
	do return self:setTimeStampLastUpdated(_g.jk.lang.LongInteger:asObject(value)) end
end

function app.NoteListDatabase.Note:getTimeStampLastUpdatedValue()
	do return _g.jk.lang.LongInteger:asLong(self._timeStampLastUpdated) end
end

function app.NoteListDatabase.Note:setTimeStampLastUpdated(value)
	self._timeStampLastUpdated = value
	do return self end
end

function app.NoteListDatabase.Note:getTimeStampLastUpdated()
	do return self._timeStampLastUpdated end
end

function app.NoteListDatabase.Note:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._id ~= nil then
		do v:setObject("id", self:asJsonValue(self._id)) end
	end
	if self._name ~= nil then
		do v:setObject("name", self:asJsonValue(self._name)) end
	end
	if self._description ~= nil then
		do v:setObject("description", self:asJsonValue(self._description)) end
	end
	if self._timeStampAdded ~= nil then
		do v:setObject("timeStampAdded", self:asJsonValue(self._timeStampAdded)) end
	end
	if self._timeStampLastUpdated ~= nil then
		do v:setObject("timeStampLastUpdated", self:asJsonValue(self._timeStampLastUpdated)) end
	end
	do return v end
end

function app.NoteListDatabase.Note:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._id = v:getString("id", nil)
	self._name = v:getString("name", nil)
	self._description = v:getString("description", nil)
	if v:get("timeStampAdded") ~= nil then
		self._timeStampAdded = _g.jk.lang.LongInteger:asObject(v:getLongInteger("timeStampAdded", 0))
	end
	if v:get("timeStampLastUpdated") ~= nil then
		self._timeStampLastUpdated = _g.jk.lang.LongInteger:asObject(v:getLongInteger("timeStampLastUpdated", 0))
	end
	do return true end
end

function app.NoteListDatabase.Note:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function app.NoteListDatabase.Note:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function app.NoteListDatabase.Note:toString()
	do return self:toJsonString() end
end

function app.NoteListDatabase.Note:forJsonString(o)
	local v = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function app.NoteListDatabase.Note:forJsonObject(o)
	local v = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

function app.NoteListDatabase:forContext(ctx)
	local cstr = _g.jk.env.EnvironmentVariable:get("NOTELIST_DATABASE")
	do _g.jk.log.Log:debug(ctx, "Opening database connection: '" .. _g.jk.lang.String:safeString(cstr) .. "'") end
	self.db = _g.jk.mysql.MySQLDatabase:forConnectionStringSync(ctx, cstr)
	if not (self.db ~= nil) then
		do _g.jk.lang.Error:throw("failedToConnectToDatabase", cstr) end
	end
	do
		local v = _g.app.NoteListDatabase._construct0(_g.app.NoteListDatabase._create())
		do v:setDb(self.db) end
		do return v end
	end
end

function app.NoteListDatabase:updateTable(table)
	if not (table ~= nil) then
		do _g.jk.lang.Error:throw("nullTable", "updateTable") end
	end
	if not (self.db ~= nil) then
		do _g.jk.lang.Error:throw("nullDb", "updateTable") end
	end
	if not self.db:ensureTableExistsSync(table) then
		do _g.jk.lang.Error:throw("failedToUpdateTable", table:getName()) end
	end
end

function app.NoteListDatabase:updateTables()
	local note = _g.jk.sql.SQLTableInfo:forName(_g.app.NoteListDatabase.NOTE)
	do note:addStringKeyColumn("id") end
	do note:addStringColumn("name") end
	do note:addStringColumn("description") end
	do note:addLongColumn("timeStampAdded") end
	do note:addLongColumn("timeStampLastUpdated") end
	do self:updateTable(note) end
end

function app.NoteListDatabase:addNote(note)
	if not (note ~= nil) then
		do return nil end
	end
	do note:setId("1") end
	do note:setTimeStampAddedValue(_g.jk.time.SystemClock:asUTCSeconds()) end
	if not self.db:executeSync(self.db:prepareInsertStatementSync(_g.app.NoteListDatabase.NOTE, note:toDynamicMap())) then
		do return nil end
	end
	do return note end
end

function app.NoteListDatabase:updateNote(id, note)
	if not (note ~= nil) then
		do return false end
	end
	do note:setTimeStampLastUpdatedValue(_g.jk.time.SystemClock:asUTCSeconds()) end
	do
		local criteria = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
		do criteria:setId(id) end
		do return self.db:executeSync(self.db:prepareUpdateStatementSync(_g.app.NoteListDatabase.NOTE, criteria:toDynamicMap(), note:toDynamicMap())) end
	end
end

function app.NoteListDatabase:deleteNote(id)
	local criteria = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
	do criteria:setId(id) end
	do return self.db:executeSync(self.db:prepareDeleteStatementSync(_g.app.NoteListDatabase.NOTE, criteria:toDynamicMap())) end
end

function app.NoteListDatabase:getNotes()
	local v = {}
	local it = self.db:querySync(self.db:prepareQueryAllStatementSync(_g.app.NoteListDatabase.NOTE, nil, nil))
	if not (it ~= nil) then
		do return nil end
	end
	while it ~= nil do
		local o = it:next()
		if not (o ~= nil) then
			do break end
		end
		do
			local note = _g.app.NoteListDatabase.Note:forJsonObject(o)
			if not (note ~= nil) then
				goto _continue1
			end
			do _g.jk.lang.Vector:append(v, note) end
		end
		::_continue1::
	end
	do
		local data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do data:setObject("records", v) end
		do return data end
	end
end

function app.NoteListDatabase:close()
	if self.db ~= nil then
		do self.db:closeSync() end
	end
	self.db = nil
end

function app.NoteListDatabase:getDb()
	do return self.db end
end

function app.NoteListDatabase:setDb(v)
	self.db = v
	do return self end
end

app.NoteListApiHandler = _g.jk.http.worker.HTTPRPCRouter._create()
app.NoteListApiHandler.__index = app.NoteListApiHandler
_vm:set_metatable(app.NoteListApiHandler, {
	__index = _g.jk.http.worker.HTTPRPCRouter
})

function app.NoteListApiHandler._create()
	local v = _vm:set_metatable({}, app.NoteListApiHandler)
	return v
end

function app.NoteListApiHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListApiHandler'
	self['_isType.app.NoteListApiHandler'] = true
	self.db = nil
	self.cors = _g.app.NoteListConfig:getCorsUtil()
end

function app.NoteListApiHandler:_construct0()
	app.NoteListApiHandler._init(self)
	do _g.jk.http.worker.HTTPRPCRouter._construct0(self) end
	return self
end

app.NoteListApiHandler.NoteRequest = _g.jk.json.JSONObjectAdapter._create()
app.NoteListApiHandler.NoteRequest.__index = app.NoteListApiHandler.NoteRequest
_vm:set_metatable(app.NoteListApiHandler.NoteRequest, {
	__index = _g.jk.json.JSONObjectAdapter
})

function app.NoteListApiHandler.NoteRequest._create()
	local v = _vm:set_metatable({}, app.NoteListApiHandler.NoteRequest)
	return v
end

function app.NoteListApiHandler.NoteRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListApiHandler.NoteRequest'
	self['_isType.app.NoteListApiHandler.NoteRequest'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._name = nil
	self._description = nil
end

function app.NoteListApiHandler.NoteRequest:_construct0()
	app.NoteListApiHandler.NoteRequest._init(self)
	do _g.jk.json.JSONObjectAdapter._construct0(self) end
	return self
end

function app.NoteListApiHandler.NoteRequest:setName(value)
	self._name = value
	do return self end
end

function app.NoteListApiHandler.NoteRequest:getName()
	do return self._name end
end

function app.NoteListApiHandler.NoteRequest:setDescription(value)
	self._description = value
	do return self end
end

function app.NoteListApiHandler.NoteRequest:getDescription()
	do return self._description end
end

function app.NoteListApiHandler.NoteRequest:toJsonObject()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if self._name ~= nil then
		do v:setObject("name", self:asJsonValue(self._name)) end
	end
	if self._description ~= nil then
		do v:setObject("description", self:asJsonValue(self._description)) end
	end
	do return v end
end

function app.NoteListApiHandler.NoteRequest:fromJsonObject(o)
	local v = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if not (v ~= nil) then
		do return false end
	end
	self._name = v:getString("name", nil)
	self._description = v:getString("description", nil)
	do return true end
end

function app.NoteListApiHandler.NoteRequest:fromJsonString(o)
	do return self:fromJsonObject(_g.jk.json.JSONParser:parse(o)) end
end

function app.NoteListApiHandler.NoteRequest:toJsonString()
	do return _g.jk.json.JSONEncoder:encode(self:toJsonObject(), true, false) end
end

function app.NoteListApiHandler.NoteRequest:toString()
	do return self:toJsonString() end
end

function app.NoteListApiHandler.NoteRequest:forJsonString(o)
	local v = _g.app.NoteListApiHandler.NoteRequest._construct0(_g.app.NoteListApiHandler.NoteRequest._create())
	if not v:fromJsonString(o) then
		do return nil end
	end
	do return v end
end

function app.NoteListApiHandler.NoteRequest:forJsonObject(o)
	local v = _g.app.NoteListApiHandler.NoteRequest._construct0(_g.app.NoteListApiHandler.NoteRequest._create())
	if not v:fromJsonObject(o) then
		do return nil end
	end
	do return v end
end

function app.NoteListApiHandler:getDatabase()
	if not (self.db ~= nil) then
		self.db = _g.app.NoteListDatabase:forContext(self:getCtx())
		do self.db:updateTables() end
	end
	do return self.db end
end

function app.NoteListApiHandler:postProcess(req, resp)
	do self.cors:handleWorkerRequest(req, resp) end
end

function app.NoteListApiHandler:initRoutes()
	do _g.jk.http.worker.HTTPRPCRouter.initRoutes(self) end
	do self:addRoute("GET", "/notes", function(req, resp, vars)
		local notes = self:getDatabase():getNotes()
		if not (notes ~= nil) then
			do return end
		end
		do self:setOkResponse(resp, notes) end
	end) end
	do self:addRoute("POST", "/note", function(req, resp, vars)
		local requestData = _g.app.NoteListApiHandler.NoteRequest:forJsonString(req:getBodyString())
		if not (requestData ~= nil) then
			do self:setErrorResponse(resp, "invalidRequest", "500") end
			do return end
		end
		do
			local note = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
			do note:setName(requestData:getName()) end
			do note:setDescription(requestData:getDescription()) end
			if not (self:getDatabase():addNote(note) ~= nil) then
				do self:setErrorResponse(resp, "failedToSaveNote", "500") end
				do return end
			end
			do self:setOkResponse(resp, nil) end
		end
	end) end
	do self:addRoute("PUT", "/note/:id", function(req, resp, vars)
		local requestData = _g.app.NoteListApiHandler.NoteRequest:forJsonString(req:getBodyString())
		if not (requestData ~= nil) then
			do self:setErrorResponse(resp, "invalidRequest", "500") end
			do return end
		end
		do
			local note = _g.app.NoteListDatabase.Note._construct0(_g.app.NoteListDatabase.Note._create())
			do note:setName(requestData:getName()) end
			do note:setDescription(requestData:getDescription()) end
			if not self:getDatabase():updateNote(vars:getString("id", nil), note) then
				do self:setErrorResponse(resp, "failedToUpdateNote", "500") end
				do return end
			end
			do self:setOkResponse(resp, nil) end
		end
	end) end
	do self:addRoute("DELETE", "/note/:id", function(req, resp, vars)
		if not self:getDatabase():deleteNote(vars:getString("id", nil)) then
			do self:setErrorResponse(resp, "failedToDeleteNote", "500") end
			do return end
		end
		do self:setOkResponse(resp, nil) end
	end) end
end

app.NoteListApiServer = _g.jk.server.web.WebServer._create()
app.NoteListApiServer.__index = app.NoteListApiServer
_vm:set_metatable(app.NoteListApiServer, {
	__index = _g.jk.server.web.WebServer
})

function app.NoteListApiServer._create()
	local v = _vm:set_metatable({}, app.NoteListApiServer)
	return v
end

function app.NoteListApiServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListApiServer'
	self['_isType.app.NoteListApiServer'] = true
end

function app.NoteListApiServer:_construct0()
	app.NoteListApiServer._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function app.NoteListApiServer:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	do server:setCreateOptionsResponseHandler(function(req)
		do return _g.app.NoteListConfig:getCorsUtil():handlePreflightRequest(req) end
	end) end
	do return true end
end

function app.NoteListApiServer:initializeApplication()
	if not _g.jk.server.web.WebServer.initializeApplication(self) then
		do return false end
	end
	do
		local db = _g.app.NoteListDatabase:forContext(self.ctx)
		do db:updateTables() end
		do db:close() end
		do return true end
	end
end

function app.NoteListApiServer:_main(args)
	do return _g.app.NoteListApiServer._construct0(_g.app.NoteListApiServer._create()):setWorker("class:app.NoteListApiHandler"):executeMain(args) end
end

app.NoteListConfig = {}
app.NoteListConfig.__index = app.NoteListConfig
_vm:set_metatable(app.NoteListConfig, {})

function app.NoteListConfig._create()
	local v = _vm:set_metatable({}, app.NoteListConfig)
	return v
end

function app.NoteListConfig:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'app.NoteListConfig'
	self['_isType.app.NoteListConfig'] = true
end

function app.NoteListConfig:_construct0()
	app.NoteListConfig._init(self)
	return self
end

function app.NoteListConfig:getAllowedOrigins()
	do return {
		"http://localhost:8080",
		"http://localhost:8081"
	} end
end

function app.NoteListConfig:getCorsUtil()
	local allowed = {}
	local array = self:getAllowedOrigins()
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local origin = array[n + 1]
				if origin ~= nil then
					do _g.jk.lang.Vector:append(allowed, _g.jk.lang.String:asString(origin)) end
				end
				do n = n + 1 end
			end
		end
	end
	do return _g.jk.http.server.cors.HTTPServerCORSUtil:forWhitelist(allowed) end
end

function _main(args)
	do return app.NoteListApiServer:_main(args) end
end
