local B=BoneUIBackport
B:Register('Frames',function(self,db)
 local frames={}
 local units={{'player','PLAYER',-265,-160},{'target','TARGET',265,-160},{'focus','FOCUS',0,-250}}
 local function create(unit,title,x,y)
  local f=CreateFrame('Frame','BoneUI_'..title,UIParent)
  f:SetWidth(230);f:SetHeight(56);f:SetPoint('CENTER',UIParent,'CENTER',x,y)
  f:SetMovable(true);f:EnableMouse(true);f:RegisterForDrag('LeftButton')
  local bg=f:CreateTexture(nil,'BACKGROUND');bg:SetAllPoints(f);bg:SetTexture('Interface\\Buttons\\WHITE8X8');bg:SetVertexColor(.035,.045,.055,.95)
  local accent=f:CreateTexture(nil,'ARTWORK');accent:SetPoint('TOPLEFT',f,'TOPLEFT');accent:SetPoint('TOPRIGHT',f,'TOPRIGHT');accent:SetHeight(2);accent:SetTexture('Interface\\Buttons\\WHITE8X8');accent:SetVertexColor(.05,.82,.62)
  local label=f:CreateFontString(nil,'OVERLAY','GameFontNormalSmall');label:SetPoint('TOPLEFT',f,'TOPLEFT',8,-6);label:SetText(title)
  local hp=CreateFrame('StatusBar',nil,f);hp:SetPoint('TOPLEFT',f,'TOPLEFT',8,-21);hp:SetWidth(214);hp:SetHeight(17);hp:SetStatusBarTexture('Interface\\TargetingFrame\\UI-StatusBar');hp:SetStatusBarColor(.13,.68,.50)
  local power=CreateFrame('StatusBar',nil,f);power:SetPoint('TOPLEFT',hp,'BOTTOMLEFT',0,-3);power:SetWidth(214);power:SetHeight(7);power:SetStatusBarTexture('Interface\\TargetingFrame\\UI-StatusBar');power:SetStatusBarColor(.2,.5,.9)
  local val=hp:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');val:SetPoint('CENTER',hp,'CENTER')
  local function update()
   if not db.enabled or not db.frames.enabled or not db.frames[unit] or not UnitExists(unit) then f:Hide();return end
   f:Show();label:SetText((UnitName(unit) or title)..'  '..(UnitLevel(unit) or ''))
   local h=UnitHealth(unit) or 0;local max=math.max(1,UnitHealthMax(unit) or 1)
   hp:SetMinMaxValues(0,max);hp:SetValue(h);val:SetText(h..' / '..max)
   local p=UnitMana(unit) or 0;local pm=math.max(1,UnitManaMax(unit) or 1)
   power:SetMinMaxValues(0,pm);power:SetValue(p)
  end
  f:RegisterEvent('PLAYER_ENTERING_WORLD');f:RegisterEvent('PLAYER_TARGET_CHANGED');f:RegisterEvent('PLAYER_FOCUS_CHANGED');f:RegisterEvent('UNIT_HEALTH');f:RegisterEvent('UNIT_MAXHEALTH');f:RegisterEvent('UNIT_MANA');f:RegisterEvent('UNIT_MAXMANA');f:RegisterEvent('UNIT_DISPLAYPOWER')
  f:SetScript('OnEvent',function(_,event,u) if not u or u==unit then update() end end)
  f:SetScript('OnDragStart',function(x) if not InCombatLockdown() then x:StartMoving() end end)
  f:SetScript('OnDragStop',function(x)
   x:StopMovingOrSizing();local a,b=x:GetCenter();local c,d=UIParent:GetCenter();db.positions[unit]={a-c,b-d}
  end)
  if db.positions[unit] then f:ClearAllPoints();f:SetPoint('CENTER',UIParent,'CENTER',unpack(db.positions[unit])) end
  frames[unit]={frame=f,update=update};update()
 end
 for _,t in ipairs(units) do create(unpack(t)) end
 self.frames=frames
 function self:RefreshFrames() for _,v in pairs(frames) do v.update() end end
end)
