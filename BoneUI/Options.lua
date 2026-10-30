local B=BoneUIBackport
B:Register('Options',function(self,db)
 local f=CreateFrame('Frame','BoneUIBackportOptions',UIParent)
 f:SetWidth(570);f:SetHeight(430);f:SetPoint('CENTER');f:SetFrameStrata('DIALOG');f:EnableMouse(true);f:SetMovable(true);f:RegisterForDrag('LeftButton')
 f:SetScript('OnDragStart',function(x) x:StartMoving() end);f:SetScript('OnDragStop',function(x) x:StopMovingOrSizing() end)
 local bg=f:CreateTexture(nil,'BACKGROUND');bg:SetAllPoints(f);bg:SetTexture('Interface\\Buttons\\WHITE8X8');bg:SetVertexColor(.035,.045,.055,.97)
 local stripe=f:CreateTexture(nil,'ARTWORK');stripe:SetPoint('TOPLEFT');stripe:SetPoint('TOPRIGHT');stripe:SetHeight(3);stripe:SetTexture('Interface\\Buttons\\WHITE8X8');stripe:SetVertexColor(.05,.82,.62)
 local logo=f:CreateTexture(nil,'ARTWORK');logo:SetTexture('Interface\\AddOns\\BoneUI\\OriginalMedia\\media\\eg-logo.tga');logo:SetWidth(34);logo:SetHeight(34);logo:SetPoint('TOPLEFT',16,-12)
 local title=f:CreateFontString(nil,'OVERLAY','GameFontNormalLarge');title:SetPoint('TOPLEFT',logo,'TOPRIGHT',10,-4);title:SetText('|cff0cd29fBoneUI|r  Ellesmere 3.3.5a Port')
 local subtitle=f:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');subtitle:SetPoint('TOPLEFT',title,'BOTTOMLEFT',0,-8);subtitle:SetText('Personal-use backport • v1.1.0 • original media')
 local close=CreateFrame('Button',nil,f,'UIPanelCloseButton');close:SetPoint('TOPRIGHT',f,'TOPRIGHT',-3,-3)
 local info=f:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');info:SetPoint('TOPLEFT',f,'TOPLEFT',22,-90);info:SetJustifyH('LEFT');info:SetText('Original-style dark interface with safe 3.3.5a replacements.\\nModern EllesmereUI modules are not yet directly compatible.')
 local items={{'Master enable',db,'enabled'},{'Player frame',db.frames,'player'},{'Target frame',db.frames,'target'},{'Focus frame',db.frames,'focus'},{'Player cast bar',db.cast,'enabled'},{'Action button accent',db.actions,'enabled'}}
 for i,item in ipairs(items) do
  local btn=CreateFrame('CheckButton',nil,f,'UICheckButtonTemplate');btn:SetPoint('TOPLEFT',f,'TOPLEFT',23,-136-(i-1)*39)
  local text=btn:CreateFontString(nil,'OVERLAY','GameFontHighlight');text:SetPoint('LEFT',btn,'RIGHT',7,0);text:SetText(item[1]);btn:SetChecked(item[2][item[3]])
  btn:SetScript('OnClick',function(x)
   item[2][item[3]]=x:GetChecked() and true or false
   if self.RefreshFrames then self:RefreshFrames() end
   if self.RefreshCast then self.RefreshCast() end
   if self.RefreshActions then self.RefreshActions() end
  end)
 end
 local note=f:CreateFontString(nil,'OVERLAY','GameFontHighlightSmall');note:SetPoint('BOTTOMLEFT',f,'BOTTOMLEFT',20,17);note:SetText('Drag frame panels to reposition. /bui reset restores defaults.')
 f:Hide();function self:ToggleOptions() if f:IsShown() then f:Hide() else f:Show() end end
end)
