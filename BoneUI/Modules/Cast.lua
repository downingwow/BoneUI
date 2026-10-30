local B=BoneUIBackport
B:Register('Cast',function(self,db)
 local f=CreateFrame('Frame','BoneUIBackportCast',UIParent);f:SetWidth(330);f:SetHeight(24);f:SetPoint('CENTER',UIParent,'CENTER',0,-325)
 local bar=CreateFrame('StatusBar',nil,f);bar:SetAllPoints(f);bar:SetStatusBarTexture('Interface\\TargetingFrame\\UI-StatusBar');bar:SetStatusBarColor(.05,.82,.62)
 local label=bar:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');label:SetPoint('LEFT',bar,'LEFT',7,0)
 local remaining=bar:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');remaining:SetPoint('RIGHT',bar,'RIGHT',-7,0)
 local start,duration,channel=0,0,false
 local function refresh()
  if not db.enabled or not db.cast.enabled then f:Hide();duration=0;return end
  local name,_,_,_,s,e=UnitCastingInfo('player');local ch=false
  if not name then name,_,_,_,s,e=UnitChannelInfo('player');ch=true end
  if not name or not s or not e or e<=s then f:Hide();duration=0;return end
  start=s/1000;duration=(e-s)/1000;channel=ch;bar:SetMinMaxValues(0,duration);label:SetText(name);f:Show()
 end
 for _,event in ipairs({'PLAYER_ENTERING_WORLD','UNIT_SPELLCAST_START','UNIT_SPELLCAST_STOP','UNIT_SPELLCAST_DELAYED','UNIT_SPELLCAST_INTERRUPTED','UNIT_SPELLCAST_FAILED','UNIT_SPELLCAST_CHANNEL_START','UNIT_SPELLCAST_CHANNEL_STOP','UNIT_SPELLCAST_CHANNEL_UPDATE'}) do f:RegisterEvent(event) end
 f:SetScript('OnEvent',function(_,e,u) if not u or u=='player' then refresh() end end)
 f:SetScript('OnUpdate',function() if duration<=0 then return end
  local v=channel and (start+duration-GetTime()) or (GetTime()-start)
  if v<0 or v>duration+.2 then refresh();return end
  bar:SetValue(math.max(0,math.min(duration,v)));remaining:SetText(string.format('%.1f',math.max(0,channel and v or duration-v)))
 end)
 self.RefreshCast=refresh;refresh()
end)
