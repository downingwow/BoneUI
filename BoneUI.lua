local addon = ...
local B = CreateFrame('Frame')
BoneUI = B
B.version = '1.0.0'
B.modules = {}
B.contact = 'https://github.com/downingwow'
local function log(s) DEFAULT_CHAT_FRAME:AddMessage('|cff0cd29fBoneUI|r: '..s) end
function B:RegisterModule(name, initialize)
 if type(name) ~= 'string' or type(initialize) ~= 'function' then return end
 self.modules[name] = initialize
 if BoneUIDB and BoneUIDB.enabled and BoneUIDB.modules[name] ~= false then
  local ok, err = pcall(initialize,self,BoneUIDB)
  if not ok then log('Module '..name..' error: '..tostring(err)) end
 end
end
local function copy(v) if type(v)~='table' then return v end local t={} for k,x in pairs(v) do t[k]=copy(x) end return t end
function B:ExportProfile() return copy(BoneUIDB and BoneUIDB.profile or {}) end
function B:ImportProfile(t) if type(t)~='table' then return false,'Expected profile table' end BoneUIDB.profile=copy(t) return true,'Reload to apply' end
function B:ImportEllesmereProfile(str) return false,'EllesmereUI serialized profile decoder is not implemented yet' end
B:SetScript('OnEvent',function(self,event)
 if event=='ADDON_LOADED' and arg1==addon then
  BoneUIDB=type(BoneUIDB)=='table' and BoneUIDB or {}
  if BoneUIDB.enabled==nil then BoneUIDB.enabled=true end
  BoneUIDB.modules=BoneUIDB.modules or {}
  BoneUIDB.profile=BoneUIDB.profile or {}
  self:UnregisterEvent('ADDON_LOADED')
  log('v'..self.version..' initialized. Type /boneui for commands.')
 end
end)
B:RegisterEvent('ADDON_LOADED')
SLASH_BONEUI1='/boneui'
SLASH_BONEUI2='/bui'
SlashCmdList.BONEUI=function(msg)
 msg=(msg or ''):lower():match('^%s*(.-)%s*$')
 if msg=='version' then log('Version '..B.version)
 elseif msg=='modules' then local found=false for n in pairs(B.modules) do found=true log(n) end if not found then log('No feature modules installed yet.') end
 elseif msg=='cvars' then log('Core does not modify game CVars.')
 else log('Commands: version, modules, cvars') end
end
