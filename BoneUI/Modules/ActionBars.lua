local B=BoneUIBackport
B:Register('ActionBars',function(self,db)
 local edges={}
 local function skin(btn)
  if not btn or edges[btn] then return end
  local tex=btn:CreateTexture(nil,'OVERLAY');tex:SetTexture('Interface\\Buttons\\WHITE8X8');tex:SetVertexColor(.05,.82,.62);tex:SetPoint('BOTTOMLEFT',btn,'BOTTOMLEFT',0,0);tex:SetPoint('BOTTOMRIGHT',btn,'BOTTOMRIGHT',0,0);tex:SetHeight(2)
  edges[btn]=tex
 end
 local function update()
  for _,prefix in ipairs({'ActionButton','MultiBarBottomLeftButton','MultiBarBottomRightButton','MultiBarLeftButton','MultiBarRightButton'}) do
   for i=1,12 do skin(_G[prefix..i]) end
  end
  for _,t in pairs(edges) do if db.enabled and db.actions.enabled then t:Show() else t:Hide() end end
 end
 self.RefreshActions=update;update()
end)
