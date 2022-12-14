ConRO.Rogue = {};
ConRO.Rogue.CheckTalents = function()
end
ConRO.Rogue.CheckPvPTalents = function()
end
local ConRO_Rogue, ids = ...;

function ConRO:EnableRotationModule(mode)
	mode = mode or 0;
	self.ModuleOnEnable = ConRO.Rogue.CheckTalents;
	self.ModuleOnEnable = ConRO.Rogue.CheckPvPTalents;	
	if mode == 0 then
		self.Description = "Rogue [No Specialization Under 10]";
		self.NextSpell = ConRO.Rogue.Under10;
		self.ToggleHealer();
	end;
    if mode == 1 then
	    self.Description = 'Rogue [Assassination]';
		if ConRO.db.profile._Spec_1_Enabled then 
			self.NextSpell = ConRO.Rogue.Assassination;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Rogue.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);		
		end
    end;
    if mode == 2 then
	    self.Description = 'Rogue [Outlaw]';
		if ConRO.db.profile._Spec_2_Enabled then
			self.NextSpell = ConRO.Rogue.Outlaw;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Rogue.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);		
		end
    end;
    if mode == 3 then
	    self.Description = 'Rogue [Sublety]';
		if ConRO.db.profile._Spec_3_Enabled then
			self.NextSpell = ConRO.Rogue.Subtlety;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Rogue.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);		
		end
    end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)
	mode = mode or 0;
	if mode == 0 then
		self.NextDef = ConRO.Rogue.Under10Def;
	end;
	if mode == 1 then
		if ConRO.db.profile._Spec_1_Enabled then
			self.NextDef = ConRO.Rogue.AssassinationDef;
		else
			self.NextDef = ConRO.Rogue.Disabled;
		end
	end;
	if mode == 2 then
		if ConRO.db.profile._Spec_2_Enabled then
			self.NextDef = ConRO.Rogue.OutlawDef;
		else
			self.NextDef = ConRO.Rogue.Disabled;
		end
	end;
	if mode == 3 then
		if ConRO.db.profile._Spec_3_Enabled then
			self.NextDef = ConRO.Rogue.SubletyDef;
		else
			self.NextDef = ConRO.Rogue.Disabled;
		end
	end;
end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
end

function ConRO.Rogue.Disabled(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	return nil;
end

function ConRO.Rogue.Under10(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');

--Resources

--Racials
	local _AncestralCall, _AncestralCall_RDY															= ConRO:AbilityReady(ids.Racial.AncestralCall, timeShift);
	local _ArcanePulse, _ArcanePulse_RDY																= ConRO:AbilityReady(ids.Racial.ArcanePulse, timeShift);
	local _Berserking, _Berserking_RDY																	= ConRO:AbilityReady(ids.Racial.Berserking, timeShift);
	local _ArcaneTorrent, _ArcaneTorrent_RDY															= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
--Warnings

--Rotations	

	
return nil;
end

function ConRO.Rogue.Under10Def(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');

--Resources

--Racials
	local _AncestralCall, _AncestralCall_RDY															= ConRO:AbilityReady(ids.Racial.AncestralCall, timeShift);
	local _ArcanePulse, _ArcanePulse_RDY																= ConRO:AbilityReady(ids.Racial.ArcanePulse, timeShift);
	local _Berserking, _Berserking_RDY																	= ConRO:AbilityReady(ids.Racial.Berserking, timeShift);
	local _ArcaneTorrent, _ArcaneTorrent_RDY															= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);

--Abilities

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
--Warnings

--Rotations	

return nil;
end

function ConRO.Rogue.Assassination(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');

--Racials
	local _ArcaneTorrent, _ArcaneTorrent_RDY															= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	local _Shadowmeld, _Shadowmeld_RDY																	= ConRO:AbilityReady(ids.Racial.Shadowmeld, timeShift);
	
--Abilities
	local _Ambush, _Ambush_RDY																			= ConRO:AbilityReady(ids.Ass_Ability.Ambush, timeShift);
	local _Envenom, _Envenom_RDY																		= ConRO:AbilityReady(ids.Ass_Ability.Envenom, timeShift);
		local _Envenom_BUFF																					= ConRO:Aura(ids.Ass_Buff.Envenom, timeShift + 1);
	local _FanofKnives, _FanofKnives_RDY 																= ConRO:AbilityReady(ids.Ass_Ability.FanofKnives, timeShift);
		local _HiddenBlades_FORM, _HiddenBlades_COUNT														= ConRO:Form(ids.Ass_Buff.HiddenBlades);
	local _Garrote, _Garrote_RDY 																		= ConRO:AbilityReady(ids.Ass_Ability.Garrote, timeShift);
		local _Garrote_DEBUFF, _, _Garrote_DUR																= ConRO:TargetAura(ids.Ass_Debuff.Garrote, timeShift);
	local _Kick, _Kick_RDY 																				= ConRO:AbilityReady(ids.Ass_Ability.Kick, timeShift);
	local _Mutilate, _Mutilate_RDY 																		= ConRO:AbilityReady(ids.Ass_Ability.Mutilate, timeShift);
	--Poisons
		local _CripplingPoison_BUFF 																		= ConRO:Aura(ids.Ass_Buff.CripplingPoison, timeShift);
		local _DeadlyPoison_BUFF 																			= ConRO:Aura(ids.Ass_Buff.DeadlyPoison, timeShift);
		local _DeadlyPoison_DEBUFF																			= ConRO:TargetAura(ids.Ass_Debuff.DeadlyPoison, timeShift);
		local _InstantPoison_BUFF 																			= ConRO:Aura(ids.Ass_Buff.InstantPoison, timeShift);
		local _WoundPoison_BUFF 																			= ConRO:Aura(ids.Ass_Buff.WoundPoison, timeShift);
	local _PoisonedKnife, _PoisonedKnife_RDY															= ConRO:AbilityReady(ids.Ass_Ability.PoisonedKnife, timeShift);	
	local _Rupture, _Rupture_RDY																		= ConRO:AbilityReady(ids.Ass_Ability.Rupture, timeShift);		
		local _Rupture_DEBUFF, _, _Rupture_DUR																= ConRO:TargetAura(ids.Ass_Debuff.Rupture, timeShift);
	local _Shadowstep, _Shadowstep_RDY																	= ConRO:AbilityReady(ids.Ass_Ability.Shadowstep, timeShift);
		local _, _Shadowstep_RANGE																			= ConRO:Targets(ids.Ass_Ability.Shadowstep);
	local _Shiv, _Shiv_RDY																				= ConRO:AbilityReady(ids.Ass_Ability.Shiv, timeShift);
	local _SliceandDice, _SliceandDice_RDY																= ConRO:AbilityReady(ids.Ass_Ability.SliceandDice, timeShift);
		local _SliceandDice_BUFF, _, _SliceandDice_DUR														= ConRO:Aura(ids.Ass_Buff.SliceandDice, timeShift);
	local _Sprint, _Sprint_RDY 																			= ConRO:AbilityReady(ids.Ass_Ability.Sprint, timeShift);	
	local _Stealth, _Stealth_RDY 																		= ConRO:AbilityReady(ids.Ass_Ability.Stealth, timeShift);
	local _Subterfuge_Stealth, _, _Subterfuge_Stealth_CD												= ConRO:AbilityReady(ids.Ass_Talent.Subterfuge_Stealth, timeShift);
		local _Subterfuge_BUFF																				= ConRO:Aura(ids.Ass_Buff.Subterfuge, timeShift);	
		local _MasterAssassin_BUFF																			= ConRO:Aura(ids.Ass_Buff.MasterAssassin, timeShift);
	local _Vanish, _Vanish_RDY 																			= ConRO:AbilityReady(ids.Ass_Ability.Vanish, timeShift);
		local _Vanish_BUFF																					= ConRO:Aura(ids.Ass_Buff.Vanish, timeShift);
	local _Vendetta, _Vendetta_RDY 																		= ConRO:AbilityReady(ids.Ass_Ability.Vendetta, timeShift);
		local _Vendetta_DEBUFF																				= ConRO:TargetAura(ids.Ass_Debuff.Vendetta, timeShift);

	local _Blindside, _Blindside_RDY																	= ConRO:AbilityReady(ids.Ass_Talent.Blindside, timeShift);	
		local _Blindside_BUFF																				= ConRO:Aura(ids.Ass_Buff.Blindside, timeShift);
	local _Exsanguinate, _Exsanguinate_RDY, _Exsanguinate_CD, _Exsanguinate_MaxCD						= ConRO:AbilityReady(ids.Ass_Talent.Exsanguinate, timeShift);
	local _CrimsonTempest, _CrimsonTempest_RDY															= ConRO:AbilityReady(ids.Ass_Talent.CrimsonTempest, timeShift);
		local _CrimsonTempest_DEBUFF																		= ConRO:TargetAura(ids.Ass_Debuff.CrimsonTempest, timeShift + 2);	
	local _MarkedforDeath, _MarkedforDeath_RDY 															= ConRO:AbilityReady(ids.Ass_Talent.MarkedforDeath, timeShift);
		local _MarkedforDeath_DEBUFF																		= ConRO:TargetAura(ids.Ass_Debuff.MarkedforDeath, timeShift);
	
		local _ElaboratePlanning_BUFF	 																	= ConRO:Aura(ids.Ass_Buff.ElaboratePlanning, timeShift);	

	local _EchoingReprimand, _EchoingReprimand_RDY														= ConRO:AbilityReady(ids.Covenant_Ability.EchoingReprimand, timeShift);
		local _EchoingReprimand_2_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_2, timeShift);
		local _EchoingReprimand_3_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_3, timeShift);
		local _EchoingReprimand_4_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_4, timeShift);
	local _Flagellation, _Flagellation_RDY																= ConRO:AbilityReady(ids.Covenant_Ability.Flagellation, timeShift);
		local _Flagellation_BUFF, _, _Flagellation_DUR														= ConRO:Aura(ids.Covenant_Buff.Flagellation, timeShift);
	local _SerratedBoneSpike, _SerratedBoneSpike_RDY													= ConRO:AbilityReady(ids.Covenant_Ability.SerratedBoneSpike, timeShift);
		local _SerratedBoneSpike_CHARGES, _SerratedBoneSpike_MaxCHARGES, _SerratedBoneSpike_CCD				= ConRO:SpellCharges(ids.Covenant_Ability.SerratedBoneSpike);
		local _SerratedBoneSpike_DEBUFF																		= ConRO:PersistentDebuff(ids.Covenant_Debuff.SerratedBoneSpike);
	local _Sepsis, _Sepsis_RDY																			= ConRO:AbilityReady(ids.Covenant_Ability.Sepsis, timeShift);
	local _Soulshape, _Soulshape_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.Soulshape, timeShift);

	local _DeathlyShadows_EQUIPPED																		= ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Legs) or ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Waist);

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();	
	
		if tChosen[ids.Ass_Talent.Subterfuge] then
			_Stealth_RDY = _Stealth_RDY and _Subterfuge_Stealth_CD <= 0;
			_Stealth = ids.Ass_Talent.Subterfuge_Stealth;
		end
	
	local _Poison_applied = false;
		if _InstantPoison_BUFF then
			_Poison_applied = true;
		elseif _DeadlyPoison_BUFF then
			_Poison_applied = true;
		elseif _WoundPoison_BUFF then
			_Poison_applied = true;
		end

	local EchoingReprimand_COUNT = 0;
		if _EchoingReprimand_2_BUFF then
			EchoingReprimand_COUNT = 2;
		end
		if _EchoingReprimand_3_BUFF then
			EchoingReprimand_COUNT = 3;
		end
		if _EchoingReprimand_4_BUFF then
			EchoingReprimand_COUNT = 4;
		end
		
--Indicators		
	ConRO:AbilityInterrupt(_Kick, _Kick_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityMovement(_Shadowstep, _Shadowstep_RDY and _Shadowstep_RANGE and not _target_in_melee);	
	ConRO:AbilityMovement(_Sprint, _Sprint_RDY and not _target_in_melee);	
	ConRO:AbilityMovement(_Soulshape, _Soulshape_RDY and not _target_in_melee);
	
	ConRO:AbilityBurst(_Vendetta, _Vendetta_RDY and _Rupture_DEBUFF and _Garrote_DEBUFF and _Energy <= (_Energy_Max - 30) and ConRO:BurstMode(_Vendetta));
	ConRO:AbilityBurst(_Vanish, _Vanish_RDY and _in_combat and not ConRO:TarYou() and ((_Combo >= _Combo_Max and not _Rupture_DEBUFF and tChosen[ids.Ass_Talent.Subterfuge]) or (tChosen[ids.Ass_Talent.Subterfuge] and not _Garrote_DEBUFF)) and ConRO:BurstMode(_Vanish));
	ConRO:AbilityBurst(_Flagellation, _Flagellation_RDY and ConRO:BurstMode(_Flagellation));
	ConRO:AbilityBurst(_Sepsis, _Sepsis_RDY and _Combo <= _Combo_Max - 1 and ConRO:BurstMode(_Sepsis));
	ConRO:AbilityBurst(_EchoingReprimand, _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ConRO:BurstMode(_EchoingReprimand));
	
--Warnings	
	ConRO:Warnings("Put lethal poison on your weapon!", not _Poison_applied and (_in_combat or _is_stealthed));
		
--Rotations	
	if not _in_combat then	
		if _Stealth_RDY and not _is_stealthed and not _Vanish_BUFF then
			return _Stealth;
		end

		if _MarkedforDeath_RDY and _Combo < 5 then
			return _MarkedforDeath;
		end
		
		if _SliceandDice_RDY and not _SliceandDice_BUFF and _Combo >= 5 then
			return _SliceandDice;
		end
		
		if _Rupture_RDY and not _Rupture_DEBUFF and _Combo >= 5 then
			return _Rupture;
		end

		if _Mutilate_RDY and _Combo <= (_Combo_Max - 1) and tChosen[ids.Ass_Talent.MasterAssassin] then
			return _Mutilate;
		end
		
		if _Garrote_RDY then
			return _Garrote;
		end
	else
		if _PoisonedKnife_RDY and _Energy_Percent >= 90 and _enemies_in_melee == 0 then
			return _PoisonedKnife;
		end

		if _Flagellation_RDY and _Combo >= (_Combo_Max - 1) and ConRO:FullMode(_Flagellation) then
			return _Flagellation;
		end

		if _Sepsis_RDY and _Combo <= (_Combo_Max - 1) and _Rupture_DEBUFF and _Garrote_DEBUFF and not _is_stealthed and ConRO:FullMode(_Sepsis) then
			return _Sepsis;
		end

		if _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ConRO:FullMode(_EchoingReprimand) then
			return _EchoingReprimand;
		end

		if _SerratedBoneSpike_RDY and (not _SerratedBoneSpike_DEBUFF or _SerratedBoneSpike_CHARGES == _SerratedBoneSpike_MaxCHARGES) and _Combo <= _Combo_Max - 2 then
			return _SerratedBoneSpike;
		end
		
		if _MarkedforDeath_RDY and _Combo == 0 and not _Subterfuge_BUFF and not _MasterAssassin_BUFF then
			return _MarkedforDeath;
		end
		
		if _Vendetta_RDY and _Rupture_DEBUFF and _Garrote_DEBUFF and not _is_stealthed and not _Subterfuge_BUFF and not _MasterAssassin_BUFF and ConRO:FullMode(_Vendetta) then
			return _Vendetta;
		end
		
		if _Vanish_RDY and not _is_stealthed and not _Subterfuge_BUFF and not _MasterAssassin_BUFF and not ConRO:TarYou() and ConRO:FullMode(_Vanish) then
			if tChosen[ids.Ass_Talent.Subterfuge] then			
				if tChosen[ids.Ass_Talent.Exsanguinate] then
					if (_Exsanguinate_RDY and _Combo <= _Combo_Max - 1) or not _Garrote_DEBUFF then
						return _Vanish;
					end
				else
					if not _Garrote_DEBUFF or (_Garrote_DEBUFF and _Garrote_DUR <= 6) then
						return _Vanish;
					end
				end
			elseif tChosen[ids.Ass_Talent.Nightstalker] then
				if tChosen[ids.Ass_Talent.Exsanguinate] then
					if not _Rupture_DEBUFF and _Exsanguinate_RDY and _Combo >= _Combo_Max - 1 then
						return _Vanish;
					end
				else
					if (not _Rupture_DEBUFF or (_Rupture_DEBUFF and _Rupture_DUR <= 7)) and _Combo >= _Combo_Max - 1 then
						return _Vanish;
					end
				end	
			else
				if _Rupture_DEBUFF and _Garrote_DEBUFF and _Vendetta_DEBUFF then
					return _Vanish;
				end
			end
		end
		
		if _Shiv_RDY and _Player_Level >= 58 then
			return _Shiv;
		end		
		
		if _Exsanguinate_RDY and not _is_stealthed and not _Subterfuge_BUFF and not _MasterAssassin_BUFF then
			if tChosen[ids.Ass_Talent.DeeperStratagem] then
				if _Rupture_DUR >= 29 and _Garrote_DUR >= 6 then
					return _Exsanguinate;
				end					
			else
				if _Rupture_DUR >= 25 and _Garrote_DUR >= 6 then
					return _Exsanguinate;
				end
			end
		end
		
		if _SliceandDice_RDY and not _SliceandDice_BUFF and _Combo >= 3 then
			return _SliceandDice;
		end		

		if _Envenom_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and (_Player_Level >= 56 and _SliceandDice_BUFF and _SliceandDice_DUR <= 2) then
			return _Envenom;
		end
		
		if _Rupture_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and _Exsanguinate_RDY then	
			return _Rupture;
		end

		if _Garrote_RDY and (not _Garrote_DEBUFF or (_Garrote_DEBUFF and _Garrote_DUR <= 3)) and not _MasterAssassin_BUFF then
			return _Garrote;
		end

		if _CrimsonTempest_RDY and not _CrimsonTempest_DEBUFF and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) then
			return _CrimsonTempest;
		end
		
		if _Rupture_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and (not _Rupture_DEBUFF or (_Rupture_DEBUFF and _Rupture_DUR <= 7)) then	
			return _Rupture;
		end
	
		if _Envenom_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and not ebuff then
			return _Envenom;
		end

		if _FanofKnives_RDY and _Combo <= (_Combo_Max - 1) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible() or _HiddenBlades_COUNT >= 20) then
			return _FanofKnives;
		end

		if _Ambush_RDY and _Combo <= (_Combo_Max - 1) and _Blindside_BUFF then
			return _Ambush;
		end
		
		if _Mutilate_RDY and _Combo <= (_Combo_Max - 1) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 2) or ConRO_SingleButton:IsVisible()) then
			return _Mutilate;
		end
	end
return nil;
end

function ConRO.Rogue.AssassinationDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');
	
--Abilities	
	local _Evasion, _Evasion_RDY 																		= ConRO:AbilityReady(ids.Ass_Ability.Evasion, timeShift);
	local _CrimsonVial, _CrimsonVial_RDY 																= ConRO:AbilityReady(ids.Ass_Ability.CrimsonVial, timeShift);

	local _FleshCraft, _FleshCraft_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.FleshCraft, timeShift);
	
--Conditions	
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();

--Rotations	
	if _Fleshcraft_RDY and not _in_combat then
		return _Fleshcraft;
	end
	
	if _CrimsonVial_RDY and _Player_Percent_Health <= 70 then
		return _CrimsonVial;
	end
	
	if _Evasion_RDY and _in_combat then
		return _Evasion;
	end

	if _Fleshcraft_RDY then
		return _Fleshcraft;
	end
return nil;
end

function ConRO.Rogue.Outlaw(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');

--Racials
	local _ArcaneTorrent, _ArcaneTorrent_RDY															= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	local _Shadowmeld, _Shadowmeld_RDY																	= ConRO:AbilityReady(ids.Racial.Shadowmeld, timeShift);
	
--Abilities	
	local _AdrenalineRush, _AdrenalineRush_RDY 															= ConRO:AbilityReady(ids.Out_Ability.AdrenalineRush, timeShift);
		local _AdrenalineRush_BUFF 																			= ConRO:Aura(ids.Out_Buff.AdrenalineRush, timeShift);
		local _LoadedDice_BUFF																				= ConRO:Aura(ids.Out_Buff.LoadedDice, timeShift);
	local _Ambush, _Ambush_RDY 																			= ConRO:AbilityReady(ids.Out_Ability.Ambush, timeShift);
	local _BetweentheEyes, _BetweentheEyes_RDY															= ConRO:AbilityReady(ids.Out_Ability.BetweentheEyes, timeShift);
	local _BladeFlurry, _BladeFlurry_RDY																= ConRO:AbilityReady(ids.Out_Ability.BladeFlurry, timeShift);
		local _BladeFlurry_BUFF																				= ConRO:Aura(ids.Out_Buff.BladeFlurry, timeShift);	
		local _BladeFlurry_CHARGES																			= ConRO:SpellCharges(ids.Out_Ability.BladeFlurry);
	local _Dispatch, _Dispatch_RDY																		= ConRO:AbilityReady(ids.Out_Ability.Dispatch, timeShift);	
	local _Eviscerate, _Eviscerate_RDY																	= ConRO:AbilityReady(ids.Out_Ability.Eviscerate, timeShift);
	local _GrapplingHook, _GrapplingHook_RDY															= ConRO:AbilityReady(ids.Out_Ability.GrapplingHook, timeShift);
	local _Kick, _Kick_RDY 																				= ConRO:AbilityReady(ids.Out_Ability.Kick, timeShift);
	--Poisons
		local _CripplingPoison_BUFF 																		= ConRO:Aura(ids.Out_Buff.CripplingPoison, timeShift);
		local _InstantPoison_BUFF 																			= ConRO:Aura(ids.Out_Buff.InstantPoison, timeShift);
		local _WoundPoison_BUFF 																			= ConRO:Aura(ids.Out_Buff.WoundPoison, timeShift);
	local _PistolShot, _PistolShot_RDY 																	= ConRO:AbilityReady(ids.Out_Ability.PistolShot, timeShift);
		local _Opportunity_BUFF																				= ConRO:Aura(ids.Out_Buff.Opportunity, timeShift);
	local _RolltheBones, _RolltheBones_RDY 																= ConRO:AbilityReady(ids.Out_Ability.RolltheBones, timeShift);
		local _RolltheBones_BUFF = {
			_TrueBearing 																					= ConRO:Aura(ids.Out_Buff.TrueBearing, timeShift + 3),
			_RuthlessPrecision 																				= ConRO:Aura(ids.Out_Buff.RuthlessPrecision, timeShift + 3),
			_SkullandCrossbones 																			= ConRO:Aura(ids.Out_Buff.SkullandCrossbones, timeShift + 3),
			_GrandMelee 																					= ConRO:Aura(ids.Out_Buff.GrandMelee, timeShift + 3),
			_Broadside 																						= ConRO:Aura(ids.Out_Buff.Broadside, timeShift + 3),
			_BuriedTreasure 																				= ConRO:Aura(ids.Out_Buff.BuriedTreasure, timeShift + 3),
		}
	local _Shadowstrike, _Shadowstrike_RDY																= ConRO:AbilityReady(ids.Out_Ability.SinisterStrike, timeShift);
	local _SliceandDice, _SliceandDice_RDY 																= ConRO:AbilityReady(ids.Out_Ability.SliceandDice, timeShift);
		local _SliceandDice_BUFF 																			= ConRO:Aura(ids.Out_Buff.SliceandDice, timeShift + 3);
	local _Sprint, _Sprint_RDY 																			= ConRO:AbilityReady(ids.Out_Ability.Sprint, timeShift);
	local _Stealth, _Stealth_RDY 																		= ConRO:AbilityReady(ids.Out_Ability.Stealth, timeShift);
	local _Vanish, _Vanish_RDY																			= ConRO:AbilityReady(ids.Out_Ability.Vanish, timeShift);

	local _BladeRush, _BladeRush_RDY, _BladeRush_CD														= ConRO:AbilityReady(ids.Out_Talent.BladeRush, timeShift);
	local _Dreadblades, _Dreadblades_RDY																= ConRO:AbilityReady(ids.Out_Talent.Dreadblades, timeShift);
	local _GhostlyStrike, _GhostlyStrike_RDY 															= ConRO:AbilityReady(ids.Out_Talent.GhostlyStrike, timeShift);
		local _GhostlyStrike_DEBUFF																			= ConRO:TargetAura(ids.Out_Debuff.GhostlyStrike, timeShift);
	local _KillingSpree, _KillingSpree_RDY, _KillingSpree_CD 											= ConRO:AbilityReady(ids.Out_Talent.KillingSpree, timeShift);
	local _MarkedforDeath, _MarkedforDeath_RDY 															= ConRO:AbilityReady(ids.Out_Talent.MarkedforDeath, timeShift);

	local _EchoingReprimand, _EchoingReprimand_RDY														= ConRO:AbilityReady(ids.Covenant_Ability.EchoingReprimand, timeShift);
		local _EchoingReprimand_2_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_2, timeShift);
		local _EchoingReprimand_3_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_3, timeShift);
		local _EchoingReprimand_4_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_4, timeShift);
	local _Flagellation, _Flagellation_RDY																= ConRO:AbilityReady(ids.Covenant_Ability.Flagellation, timeShift);
		local _Flagellation_BUFF, _, _Flagellation_DUR														= ConRO:Aura(ids.Covenant_Buff.Flagellation, timeShift);
	local _SerratedBoneSpike, _SerratedBoneSpike_RDY													= ConRO:AbilityReady(ids.Covenant_Ability.SerratedBoneSpike, timeShift);
		local _SerratedBoneSpike_DEBUFF																		= ConRO:PersistentDebuff(ids.Covenant_Debuff.SerratedBoneSpike);
	local _Sepsis, _Sepsis_RDY																			= ConRO:AbilityReady(ids.Covenant_Ability.Sepsis, timeShift);
	local _Soulshape, _Soulshape_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.Soulshape, timeShift);

	local _DeathlyShadows_EQUIPPED																		= ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Legs) or ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Waist);

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();
	local _combat_stealth 																				= _is_stealthed or _Vanish_BUFF or _Shadowmeld_BUFF;
	
	local _RolltheBones_COUNT = 0;
		for k, v in pairs(_RolltheBones_BUFF) do
			if v then
				_RolltheBones_COUNT = _RolltheBones_COUNT + 1;
			end
		end

    local _should_Roll = false;
		if _RolltheBones_COUNT <= 1 and _LoadedDice_BUFF then
			_should_Roll = true;
		end
		if (_RolltheBones_COUNT == 1 and (_RolltheBones_BUFF._BuriedTreasure or _RolltheBones_BUFF._GrandMelee)) or (_RolltheBones_COUNT == 2 and (_RolltheBones_BUFF._BuriedTreasure and _RolltheBones_BUFF._GrandMelee)) then
			_should_Roll = true;
		end
		if _RolltheBones_COUNT <= 0 then
			_should_Roll = true;
		end
			
	local _Broadside_Reward = 0
	local _Opportunity_Reward = 0	
		if _RolltheBones_BUFF._Broadside then
			_Broadside_Reward = _Broadside_Reward + 1;
		end
		if tChosen[ids.Out_Talent.QuickDraw] and _Opportunity_BUFF then
			_Opportunity_Reward = _Opportunity_Reward + 1;
		end
	
	local _Poison_applied = false;
		if _InstantPoison_BUFF then
			_Poison_applied = true;
		elseif _WoundPoison_BUFF then
			_Poison_applied = true;
		end
		
	local EchoingReprimand_COUNT = 0;
		if _EchoingReprimand_2_BUFF then
			EchoingReprimand_COUNT = 2;
		end
		if _EchoingReprimand_3_BUFF then
			EchoingReprimand_COUNT = 3;
		end
		if _EchoingReprimand_4_BUFF then
			EchoingReprimand_COUNT = 4;
		end
	
--Indicators	
	ConRO:AbilityInterrupt(_Kick, _Kick_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityMovement(_GrapplingHook, _GrapplingHook_RDY and not _target_in_melee);	
	ConRO:AbilityMovement(_Sprint, _Sprint_RDY and not _target_in_melee);		
	ConRO:AbilityMovement(_Soulshape, _Soulshape_RDY and not _target_in_melee);
	
    ConRO:AbilityBurst(_AdrenalineRush, _AdrenalineRush_RDY and ConRO:BurstMode(_AdrenalineRush));
	ConRO:AbilityBurst(_BladeRush, _BladeRush_RDY and (((ConRO_AutoButton:IsVisible() and _enemies_in_melee == 1) or ConRO_SingleButton:IsVisible()) or (_BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()))) and ConRO:BurstMode(_BladeRush));
	ConRO:AbilityBurst(_Dreadblades, _Dreadblades_RDY and _Combo <= 1 and ConRO:BurstMode(_Dreadblades));
	ConRO:AbilityBurst(_KillingSpree, _KillingSpree_RDY and not _AdrenalineRush_BUFF and _Energy <= _Energy_Max - 35 and (((ConRO_AutoButton:IsVisible() and _enemies_in_melee == 1) or ConRO_SingleButton:IsVisible()) or (_BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()))) and ConRO:BurstMode(_KillingSpree));
	ConRO:AbilityBurst(_MarkedforDeath, _MarkedforDeath_RDY and _Combo <= 1 and ConRO:BurstMode(_MarkedforDeath));
	ConRO:AbilityBurst(_RolltheBones, _RolltheBones_RDY and _should_Roll and ConRO:BurstMode(_RolltheBones));
	ConRO:AbilityBurst(_Vanish, _Vanish_RDY and not _combat_stealth and not ConRO:TarYou() and _Combo <= 1 and _Energy >= 50 and ConRO:BurstMode(_Vanish));
	ConRO:AbilityBurst(_Shadowmeld, _Shadowmeld_RDY and not _combat_stealth and not ConRO:TarYou() and _Combo <= 1 and _Energy >= 50 and ConRO:BurstMode(_Shadowmeld));
		
	ConRO:AbilityBurst(_Flagellation, _Flagellation_RDY and ConRO:BurstMode(_Flagellation));
	ConRO:AbilityBurst(_Sepsis, _Sepsis_RDY and _Combo <= _Combo_Max - 1 and ConRO:BurstMode(_Sepsis, timeShift));
	ConRO:AbilityBurst(_EchoingReprimand, _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ConRO:BurstMode(_EchoingReprimand));

--Warnings	
	ConRO:Warnings("Put lethal poison on your weapon!", not _Poison_applied and (_in_combat or _is_stealthed));
		
--Rotations
	if not _in_combat then
		if _Stealth_RDY and not _combat_stealth then
			return _Stealth;
		end
		
		if _MarkedforDeath_RDY and _Combo < 5 and ConRO:FullMode(_MarkedforDeath) then
			return _MarkedforDeath;
		end
		
		if _SliceandDice_RDY and not _SliceandDice_BUFF and _Combo >= (_Combo_Max - 2) then
			return _SliceandDice;
		end

		if _Dispatch_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) then
			return _Dispatch;
		end
	
		if _Eviscerate_RDY and _Player_Level < 22 and _Combo >= (_Combo_Max - 1) then --Only under lvl 21
			return _Eviscerate;
		end
		
		if _RolltheBones_RDY and _should_Roll and ConRO:FullMode(_RolltheBones) then
			return _RolltheBones;
		end
		
		if _Ambush_RDY and _Combo <= _Combo_Max - 2 then
			return _Ambush;
		end
	elseif _combat_stealth then
		if _Dispatch_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) then
			return _Dispatch;
		end
		
		if _Ambush_RDY and _Combo <= _Combo_Max - 2 then
			return _Ambush;
		end		
	else
		if _Flagellation_RDY and _Combo >= (_Combo_Max - 1) and ConRO:FullMode(_Flagellation) then
			return _Flagellation;
		end
		
		if _AdrenalineRush_RDY and ConRO:FullMode(_AdrenalineRush) then
			return _AdrenalineRush;
		end

		if _RolltheBones_RDY and _should_Roll and ConRO:FullMode(_RolltheBones) then
			return _RolltheBones;
		end
		
		if _BladeFlurry_RDY and not _BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) then
			return _BladeFlurry;
		end

		if _MarkedforDeath_RDY and _Combo <= 1 and ConRO:FullMode(_MarkedforDeath) then
			return _MarkedforDeath;
		end

		if _GhostlyStrike_RDY and not _GhostlyStrike_DEBUFF and _Combo <= (_Combo_Max - 1 - _Broadside_Reward) and (((ConRO_AutoButton:IsVisible() and _enemies_in_melee == 1) or ConRO_SingleButton:IsVisible()) or (_BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()))) then
			return _GhostlyStrike;
		end
		
		if _KillingSpree_RDY and _Energy <= _Energy_Max - 35 and (((ConRO_AutoButton:IsVisible() and _enemies_in_melee == 1) or ConRO_SingleButton:IsVisible()) or (_BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()))) and ConRO:FullMode(_KillingSpree) then
			return _KillingSpree;
		end
		
		if _BladeRush_RDY and (((ConRO_AutoButton:IsVisible() and _enemies_in_melee == 1) or ConRO_SingleButton:IsVisible()) or (_BladeFlurry_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()))) and ConRO:FullMode(_BladeRush) then
			return _BladeRush;
		end	

		if _Dreadblades_RDY and _Combo <= 1 and ConRO:FullMode(_Dreadblades) then
			return _Dreadblades;
		end
		
		if _Vanish_RDY and not _combat_stealth and not ConRO:TarYou() and _Combo <= 1 and _Energy >= 50 and ConRO:FullMode(_Vanish) then		
			return _Vanish;
		end
		
		if _Shadowmeld_RDY and not _combat_stealth and not ConRO:TarYou() and _Combo <= 1 and _Energy >= 50 and ConRO:FullMode(_Shadowmeld) then
			return _Shadowmeld;
		end		

		if _SerratedBoneSpike_RDY and not _SerratedBoneSpike_DEBUFF and _Combo <= _Combo_Max - 2 then
			return _SerratedBoneSpike;
		end
		
		if _Sepsis_RDY and _Combo <= _Combo_Max - 1 and ConRO:FullMode(_Sepsis) then
			return _Sepsis;
		end
		
		if _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ConRO:FullMode(_EchoingReprimand) then
			return _EchoingReprimand;
		end
		
		if _SliceandDice_RDY and _Combo >= (_Combo_Max - 1) and not _SliceandDice_BUFF then
			return _SliceandDice;
		end		
		
		if _BetweentheEyes_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) then 
			return _BetweentheEyes;
		end		
		
		if _Eviscerate_RDY and _Player_Level < 22 and _Combo >= (_Combo_Max - 1) then --Only under lvl 21
			return _Eviscerate;
		end
		
		if _Dispatch_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) then
			return _Dispatch;
		end
		
		if _Ambush_RDY and _Combo <= _Combo_Max - 2 then
			return _Ambush;
		end

		if _PistolShot_RDY and _Opportunity_BUFF and _Combo <= 3 then
			return _PistolShot;
		end

		if _Shadowstrike_RDY and _Combo <= (_Combo_Max - 1) then
			return _Shadowstrike;
		end
	end
return nil;
end

function ConRO.Rogue.OutlawDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');
	
--Abilities	
	local _Evasion, _Evasion_RDY																		= ConRO:AbilityReady(ids.Out_Ability.Evasion, timeShift);
	local _CrimsonVial, _CrimsonVial_RDY 																= ConRO:AbilityReady(ids.Out_Ability.CrimsonVial, timeShift);

	local _FleshCraft, _FleshCraft_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.FleshCraft, timeShift);
	
--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();

--Rotations	
	if _Fleshcraft_RDY and not _in_combat then
		return _Fleshcraft;
	end
	
	if _CrimsonVial_RDY and _Player_Percent_Health <= 70 then
		return _CrimsonVial;
	end
	
	if _Evasion_RDY and _in_combat then
		return _Evasion;
	end
	
	if _Fleshcraft_RDY then
		return _Fleshcraft;
	end
return nil;
end

function ConRO.Rogue.Subtlety(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _is_PvP_Target																				= _is_PvP and _is_PC and _is_Enemy;
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');

--Racials
	local _ArcaneTorrent, _ArcaneTorrent_RDY															= ConRO:AbilityReady(ids.Racial.ArcaneTorrent, timeShift);
	local _Shadowmeld, _Shadowmeld_RDY																	= ConRO:AbilityReady(ids.Racial.Shadowmeld, timeShift);
		local _Shadowmeld_BUFF 																				= ConRO:Aura(ids.Racial.Shadowmeld, timeShift);	
		
--Abilities	
	local _Backstab, _Backstab_RDY 																		= ConRO:AbilityReady(ids.Sub_Ability.Backstab, timeShift);
	local _BlackPowder, _BlackPowder_RDY																= ConRO:AbilityReady(ids.Sub_Ability.BlackPowder, timeShift);
	local _CheapShot, _CheapShot_RDY 																	= ConRO:AbilityReady(ids.Sub_Ability.CheapShot, timeShift);
	local _Eviscerate, _Eviscerate_RDY 																	= ConRO:AbilityReady(ids.Sub_Ability.Eviscerate, timeShift);
	local _Kick, _Kick_RDY 																				= ConRO:AbilityReady(ids.Sub_Ability.Kick, timeShift);
	local _KidneyShot, _KidneyShot_RDY 																	= ConRO:AbilityReady(ids.Sub_Ability.KidneyShot, timeShift);
	--Poisons
		local _CripplingPoison_BUFF 																		= ConRO:Aura(ids.Sub_Buff.CripplingPoison, timeShift);
		local _InstantPoison_BUFF 																			= ConRO:Aura(ids.Sub_Buff.InstantPoison, timeShift);
		local _WoundPoison_BUFF 																			= ConRO:Aura(ids.Sub_Buff.WoundPoison, timeShift);
	local _Rupture, _Rupture_RDY																		= ConRO:AbilityReady(ids.Sub_Ability.Rupture, timeShift);		
		local _Rupture_DEBUFF																				= ConRO:TargetAura(ids.Sub_Debuff.Rupture, timeShift + 4);
	local _ShadowBlades, _ShadowBlades_RDY 																= ConRO:AbilityReady(ids.Sub_Ability.ShadowBlades, timeShift);
		local _ShadowBlades_BUFF 																			= ConRO:Aura(ids.Sub_Buff.ShadowBlades, timeShift);
	local _ShadowDance, _ShadowDance_RDY, _ShadowDance_CD												= ConRO:AbilityReady(ids.Sub_Ability.ShadowDance, timeShift);
		local _ShadowDance_CHARGES, _ShadowDance_MaxCHARGES, _ShadowDance_CCD								= ConRO:SpellCharges(ids.Sub_Ability.ShadowDance);
		local _ShadowDance_BUFF 																			= ConRO:Aura(ids.Sub_Buff.ShadowDance, timeShift);
	local _Shadowstep, _Shadowstep_RDY																	= ConRO:AbilityReady(ids.Sub_Ability.Shadowstep, timeShift);
		local _Shadowstep_RANGE																				= ConRO:Targets(ids.Sub_Ability.Shadowstep);
	local _Shiv, _Shiv_RDY																				= ConRO:AbilityReady(ids.Sub_Ability.Shiv, timeShift);
	local _ShurikenStorm, _ShurikenStorm_RDY 															= ConRO:AbilityReady(ids.Sub_Ability.ShurikenStorm, timeShift);
	local _ShurikenToss, _ShurikenToss_RDY 																= ConRO:AbilityReady(ids.Sub_Ability.ShurikenToss, timeShift);
	local _Shadowstrike, _Shadowstrike_RDY 																= ConRO:AbilityReady(ids.Sub_Ability.Shadowstrike, timeShift);
		local _FindWeakness_DEBUFF 																			= ConRO:TargetAura(ids.Sub_Debuff.FindWeakness, timeShift);	
	local _SliceandDice, _SliceandDice_RDY																= ConRO:AbilityReady(ids.Sub_Ability.SliceandDice, timeShift);
		local _SliceandDice_BUFF																			= ConRO:Aura(ids.Sub_Buff.SliceandDice, timeShift + 4);
	local _Sprint, _Sprint_RDY 																			= ConRO:AbilityReady(ids.Sub_Ability.Sprint, timeShift);	
	local _Stealth, _Stealth_RDY, _Stealth_CD																= ConRO:AbilityReady(ids.Sub_Ability.Stealth, timeShift);
	local _SymbolsofDeath, _SymbolsofDeath_RDY, _SymbolsofDeath_CD										= ConRO:AbilityReady(ids.Sub_Ability.SymbolsofDeath, timeShift);
		local _SymbolsofDeath_BUFF 																			= ConRO:Aura(ids.Sub_Buff.SymbolsofDeath, timeShift);
	local _Vanish, _Vanish_RDY																			= ConRO:AbilityReady(ids.Sub_Ability.Vanish, timeShift);
		local _Vanish_BUFF 																					= ConRO:Aura(ids.Sub_Buff.Vanish, timeShift);

	local _Gloomblade, _Gloomblade_RDY																	= ConRO:AbilityReady(ids.Sub_Talent.Gloomblade, timeShift);
	local _MarkedforDeath, _MarkedforDeath_RDY															= ConRO:AbilityReady(ids.Sub_Talent.MarkedforDeath, timeShift);
		local _MarkedforDeath_DEBUFF 																		= ConRO:TargetAura(ids.Sub_Debuff.MarkedforDeath, timeShift);	
	local _SecretTechnique, _SecretTechnique_RDY														= ConRO:AbilityReady(ids.Sub_Talent.SecretTechnique, timeShift);
	local _ShurikenTornado, _ShurikenTornado_RDY														= ConRO:AbilityReady(ids.Sub_Talent.ShurikenTornado, timeShift);
	local _Subterfuge_Stealth, _, _Subterfuge_Stealth_CD 												= ConRO:AbilityReady(ids.Sub_Talent.Subterfuge_Stealth, timeShift);
		local _Premeditation_FORM																			= ConRO:Form(ids.Sub_Form.Premeditation);
	
	local _EchoingReprimand, _EchoingReprimand_RDY														= ConRO:AbilityReady(ids.Covenant_Ability.EchoingReprimand, timeShift);
		local _EchoingReprimand_2_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_2, timeShift);
		local _EchoingReprimand_3_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_3, timeShift);
		local _EchoingReprimand_4_BUFF																		= ConRO:Aura(ids.Covenant_Buff.EchoingReprimand_4, timeShift);
	local _Flagellation, _Flagellation_RDY																= ConRO:AbilityReady(ids.Covenant_Ability.Flagellation, timeShift);
		local _Flagellation_BUFF, _, _Flagellation_DUR														= ConRO:Aura(ids.Covenant_Buff.Flagellation, timeShift);
	local _SerratedBoneSpike, _SerratedBoneSpike_RDY													= ConRO:AbilityReady(ids.Covenant_Ability.SerratedBoneSpike, timeShift);
		local _SerratedBoneSpike_CHARGES, _SerratedBoneSpike_MaxCHARGES, _SerratedBoneSpike_CCD				= ConRO:SpellCharges(ids.Covenant_Ability.SerratedBoneSpike);
		local _SerratedBoneSpike_DEBUFF																		= ConRO:PersistentDebuff(ids.Covenant_Debuff.SerratedBoneSpike);
	local _Sepsis, _Sepsis_RDY																			= ConRO:AbilityReady(ids.Covenant_Ability.Sepsis, timeShift);
		local _Sepsis_BUFF																					= ConRO:Aura(ids.Covenant_Buff.Sepsis, timeShift);	
	local _Soulshape, _Soulshape_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.Soulshape, timeShift);

	local _DeathlyShadows_EQUIPPED																		= ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Legs) or ConRO:ItemEquipped(ids.Legendary.DeathlyShadows_Waist);
	local _MarkoftheMasterAssassin_EQUIPPED																= ConRO:ItemEquipped(ids.Legendary.MarkoftheMasterAssassin_Finger) or ConRO:ItemEquipped(ids.Legendary.MarkoftheMasterAssassin_Wrist);
	local _TinyToxicBlade_EQUIPPED																		= ConRO:ItemEquipped(ids.Legendary.TinyToxicBlade_Feet) or ConRO:ItemEquipped(ids.Legendary.TinyToxicBlade_Waist);

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();
	local _combat_stealth 																				= _is_stealthed or _ShadowDance_BUFF or _Vanish_BUFF or _Shadowmeld_BUFF or _Sepsis_BUFF;
	
		if tChosen[ids.Sub_Talent.Subterfuge] then
			_Stealth_RDY = _Stealth_RDY and _Subterfuge_Stealth_CD <= 0;
			_Stealth = ids.Sub_Talent.Subterfuge_Stealth;
		end
	
		if tChosen[ids.Sub_Talent.Gloomblade] then
			_Backstab_RDY = _Gloomblade_RDY;
			_Backstab = ids.Sub_Talent.Gloomblade;
		end

	local _Poison_applied = false;
		if _InstantPoison_BUFF then
			_Poison_applied = true;
		elseif _WoundPoison_BUFF then
			_Poison_applied = true;
		end

	local EchoingReprimand_COUNT = 0;
		if _EchoingReprimand_2_BUFF then
			EchoingReprimand_COUNT = 2;
		end
		if _EchoingReprimand_3_BUFF then
			EchoingReprimand_COUNT = 3;
		end
		if _EchoingReprimand_4_BUFF then
			EchoingReprimand_COUNT = 4;
		end
		
--Indicators		
	ConRO:AbilityInterrupt(_Kick, _Kick_RDY and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_CheapShot, _CheapShot_RDY and (_Combo <= _Combo_Max - 1) and _is_PvP_Target and ConRO:Interrupt());
	ConRO:AbilityInterrupt(_KidneyShot, _KidneyShot_RDY and (_Combo >= _Combo_Max - 1) and _is_PvP_Target and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityMovement(_Shadowstep, _Shadowstep_RDY and _Shadowstep_RANGE and not _target_in_melee);	
	ConRO:AbilityMovement(_Sprint, _Sprint_RDY and not _target_in_melee);		
	ConRO:AbilityMovement(_Soulshape, _Soulshape_RDY and not _target_in_melee);

	ConRO:AbilityBurst(_SecretTechnique, _SecretTechnique_RDY and (_SymbolsofDeath_BUFF or (not _SymbolsofDeath_BUFF and _SymbolsofDeath_CD > 5)) and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and ConRO:BurstMode(_SecretTechnique));
	ConRO:AbilityBurst(_ShadowBlades, _ShadowBlades_RDY and _SymbolsofDeath_BUFF and ConRO:BurstMode(_ShadowBlades));
	ConRO:AbilityBurst(_ShadowDance, _ShadowDance_RDY and not _combat_stealth and _SymbolsofDeath_BUFF and ConRO:BurstMode(_ShadowDance));
	ConRO:AbilityBurst(_Shadowmeld, _Shadowmeld_RDY and not ConRO:TarYou() and not _combat_stealth and not _FindWeakness_DEBUFF and _Combo <= 0 and ConRO:BurstMode(_Shadowmeld));
	ConRO:AbilityBurst(_Vanish, _Vanish_RDY and not ConRO:TarYou() and not _combat_stealth and _Energy >= 45 and _Combo <= 1 and ConRO:BurstMode(_Vanish))
	ConRO:AbilityBurst(_MarkedforDeath, _MarkedforDeath_RDY and _Combo <= 1 and ConRO:BurstMode(_MarkedforDeath));

	ConRO:AbilityBurst(_Flagellation, _Flagellation_RDY and ConRO:BurstMode(_Flagellation));
	ConRO:AbilityBurst(_Sepsis, _Sepsis_RDY and _Combo <= _Combo_Max - 1 and ConRO:BurstMode(_Sepsis));
	ConRO:AbilityBurst(_EchoingReprimand, _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 4) or ConRO_SingleButton:IsVisible()) and ConRO:BurstMode(_EchoingReprimand));

--Warnings	
	ConRO:Warnings("Put lethal poison on your weapon!", not _Poison_applied and (_in_combat or _is_stealthed));

--Rotations
	if not _in_combat then
		if _Stealth_RDY and not _is_stealthed then
			return _Stealth;
		end

		if _MarkedforDeath_RDY and _Combo <= 1 and ConRO:FullMode(_MarkedforDeath) then
			return _MarkedforDeath;
		end

		if _SliceandDice_RDY and not _SliceandDice_BUFF and _Combo >= 5 then
			return _SliceandDice;
		end
		
		if _ShadowBlades_RDY and _MarkoftheMasterAssassin_EQUIPPED and ConRO:FullMode(_ShadowBlades) then
			return _ShadowBlades;
		end
		
		if _Shadowstrike_RDY and _combat_stealth and _Combo <= _Combo_Max - 1 then
			return _Shadowstrike;
		end	
	else
		if _Stealth_CD > 0 and _Combo >= 1 then
			if _SliceandDice_RDY and not _SliceandDice_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 5) or ConRO_SingleButton:IsVisible()) then
				return _SliceandDice;
			end
		
			if _Rupture_RDY and not _Rupture_DEBUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 5) or ConRO_SingleButton:IsVisible()) then
				return _Rupture;
			end
		end
		
		if not _target_in_melee then
			if _ShurikenToss_RDY and _Combo <= _Combo_Max - 1 or _Target_Percent_Health <= 5 then
				return _ShurikenToss;
			end
		end
		
		if _ShadowBlades_RDY and _SymbolsofDeath_BUFF and ConRO:FullMode(_ShadowBlades) then
			return _ShadowBlades;
		end
		
		if _Flagellation_RDY and ConRO:FullMode(_Flagellation) then
			return _Flagellation;
		end

		if _Rupture_RDY and (_ShadowDance_CHARGES == 1 and _ShadowDance_CCD <= 8) and (_Combo >= _Combo_Max - 1 or _Combo == EchoingReprimand_COUNT) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 5) or ConRO_SingleButton:IsVisible()) then
			return _Rupture;
		end

		if _SerratedBoneSpike_RDY and ((not _SerratedBoneSpike_DEBUFF and _Combo <= _Combo_Max - 1) or ((_SerratedBoneSpike_CHARGES == _SerratedBoneSpike_MaxCHARGES or (_SerratedBoneSpike_CHARGES == _SerratedBoneSpike_MaxCHARGES - 1 and _SerratedBoneSpike_CCD <= 1.5)) and _Combo <= _Combo_Max - 2)) then
			return _SerratedBoneSpike;
		end
		
		if _Sepsis_RDY and _Combo <= _Combo_Max - 1 and ConRO:FullMode(_Sepsis) then
			return _Sepsis;
		end
		
		if _SymbolsofDeath_RDY and _ShadowDance_RDY then
			return _SymbolsofDeath;
		end
		
		if _ShadowDance_RDY and not _combat_stealth and _SymbolsofDeath_BUFF and ConRO:FullMode(_ShadowDance) then
			return _ShadowDance;
		end
		
		if _Vanish_RDY and not ConRO:TarYou() and not _combat_stealth and not _FindWeakness_DEBUFF and _Combo <= 1 and ConRO:FullMode(_Vanish) then
			return _Vanish;
		end

		if _Shadowmeld_RDY and not ConRO:TarYou() and not _combat_stealth and not _FindWeakness_DEBUFF and _Combo <= 1 and ConRO:FullMode(_Shadowmeld) then
			return _Shadowmeld;
		end

		if _MarkedforDeath_RDY and _Combo <= 1 and ConRO:FullMode(_MarkedforDeath) then
			return _MarkedforDeath;
		end
		
		if _Shiv_RDY and _TinyToxicBlade_EQUIPPED and (not _ShadowDance_BUFF or (_ShadowDance_BUFF and tChosen[ids.Sub_Talent.Nightstalker])) then
			return _Shiv;
		end
		
		if _EchoingReprimand_RDY and _Combo <= _Combo_Max - 2 and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 4) or ConRO_SingleButton:IsVisible()) and ConRO:FullMode(_EchoingReprimand) then
			return _EchoingReprimand;
		end

		if _ShurikenTornado_RDY and _SymbolsofDeath_BUFF and _ShadowDance_BUFF then
			return _ShurikenTornado;
		end
		
		if _SliceandDice_RDY and not _SliceandDice_BUFF and _Combo >= (_Combo_Max - 1) and not _ShadowDance_BUFF and (not tChosen[ids.Sub_Talent.Premeditation] or (tChosen[ids.Sub_Talent.Premeditation] and not (not _combat_stealth and _SymbolsofDeath_BUFF and ConRO:FullMode(_ShadowDance)))) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 5) or ConRO_SingleButton:IsVisible()) then
			return _SliceandDice;
		end		

		if _Rupture_RDY and not _Rupture_DEBUFF and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 5) or ConRO_SingleButton:IsVisible()) then
			return _Rupture;
		end
		
		if _SecretTechnique_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and ConRO:FullMode(_SecretTechnique) then
			return _SecretTechnique;
		end	

		if _BlackPowder_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible()) then
			return _BlackPowder;
		end		
		
		if _Eviscerate_RDY and (_Combo >= (_Combo_Max - 1) or _Combo == EchoingReprimand_COUNT) then
			return _Eviscerate;
		end

		if _Shadowstrike_RDY and _combat_stealth and _Premeditation_FORM and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee <= 4) or ConRO_SingleButton:IsVisible()) then
			return _Shadowstrike;
		end	

		if _ShurikenStorm_RDY and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 3) or ConRO_AoEButton:IsVisible()) and _Combo <= _Combo_Max - 1 then 
			return _ShurikenStorm;
		end
		
		if _Shadowstrike_RDY and _combat_stealth and _Combo <= _Combo_Max - 1 then
			return _Shadowstrike;
		end		

		if _ShurikenStorm_RDY and ((ConRO_AutoButton:IsVisible() and _enemies_in_melee >= 2) or ConRO_AoEButton:IsVisible()) and _Combo <= _Combo_Max - 1 then 
			return _ShurikenStorm;
		end
		
		if _Backstab_RDY and _Combo <= _Combo_Max - 1 then
			return _Backstab;
		end
	end
    return nil;
end

function ConRO.Rogue.SubletyDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
--Info
	local _Player_Level																					= UnitLevel("player");
	local _Player_Percent_Health 																		= ConRO:PercentHealth('player');
	local _is_PvP																						= ConRO:IsPvP();
	local _in_combat 																					= UnitAffectingCombat('player');
	local _party_size																					= GetNumGroupMembers();
	
	local _is_PC																						= UnitPlayerControlled("target");
	local _is_Enemy 																					= ConRO:TarHostile();
	local _Target_Health 																				= UnitHealth('target');
	local _Target_Percent_Health 																		= ConRO:PercentHealth('target');
	
--Resources
	local _Energy, _Energy_Max, _Energy_Percent															= ConRO:PlayerPower('Energy');
	local _Combo, _Combo_Max																			= ConRO:PlayerPower('Combo');
	
--Abilities	
	local _Evasion, _Evasion_RDY 																		= ConRO:AbilityReady(ids.Sub_Ability.Evasion, timeShift);
	local _CrimsonVial, _CrimsonVial_RDY 																= ConRO:AbilityReady(ids.Sub_Ability.CrimsonVial, timeShift);

	local _FleshCraft, _FleshCraft_RDY																	= ConRO:AbilityReady(ids.Covenant_Ability.FleshCraft, timeShift);

--Conditions
	local _is_moving 																					= ConRO:PlayerSpeed();
	local _enemies_in_melee, _target_in_melee															= ConRO:Targets("Melee");
	local _target_in_10yrds 																			= CheckInteractDistance("target", 3);
	
	local _is_stealthed																					= IsStealthed();
	
--Rotations	
	if _Fleshcraft_RDY and not _in_combat then
		return _Fleshcraft;
	end
	
	if _CrimsonVial_RDY and _Player_Percent_Health <= 70 then
		return _CrimsonVial;
	end	
	
	if _Evasion_RDY and _in_combat then
		return _Evasion;
	end

	if _Fleshcraft_RDY then
		return _Fleshcraft;
	end
return nil;
end