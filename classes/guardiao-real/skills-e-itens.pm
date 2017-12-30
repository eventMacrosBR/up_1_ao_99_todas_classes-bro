automacro configurarGolpeFulminante {
	SkillLevel SM_BASH = 10
	SkillLevel CR_HOLYCROSS != 10 #essa automacro nao vai ativar quando o holycross tiver lvl máximo
	exclusive 1
	ConfigKeyNot attackSkillSlot_0 SM_BASH
	call {
		do conf attackSkillSlot_0 SM_BASH
		do conf attackSkillSlot_0_lvl 10
		do conf attackSkillSlot_0_sp >= 15
		do conf attackSkillSlot_0_maxUses 1
		do conf attackSkillSlot_0_maxAttempts 3
		do conf attackSkillSlot_0_inLockOnly 1
	}
}

automacro configurarHolyCross {
	SkillLevel CR_HOLYCROSS = 10
	exclusive 1
	ConfigKeyNot attackSkillSlot_0 CR_HOLYCROSS
	call {
		do conf attackSkillSlot_0 CR_HOLYCROSS
		do conf attackSkillSlot_0_lvl 10
		do conf attackSkillSlot_0_sp >= 20
		do conf attackSkillSlot_0_maxUses 1
		do conf attackSkillSlot_0_maxAttempts 3
		do conf attackSkillSlot_0_inLockOnly 1
		do conf attackSkillSlot_0_notMonsters Argos
	}
}

automacro configurarMedicar {
	SkillLevel AL_CURE = 1
	exclusive 1
	ConfigKeyNot useSelf_skill_0 AL_CURE
	call {
		do conf useSelf_skill_0 AL_CURE
		do conf useSelf_skill_0_lvl 1
		do conf useSelf_skill_0_sp > 15
		do conf useSelf_skill_0_whenStatusActive EFST_HEALTHSTATE_BLIND
	}
}

automacro configurarPotBranca {
	ConfigKeyNot useSelf_item_1 504 #Poção Branca
	exclusive 1
	call {
		$blocoExiste = checarSeExisteNoConfig("useSelf_item_1")
		if ($blocoExiste = nao ) {
			adicionaUseSelfItem()
			do reload config
		}
		do conf useSelf_item_1 504 #Poção Branca
		do conf useSelf_item_1_hp < 60%
		do conf useSelf_item_1_disabled 0
	}
}

automacro pegarPeco_irAteNpc {
	SkillLevel KN_CAVALIERMASTERY = 5
	exclusive 1
	StatusInactiveHandle EFST_RIDING
	NpcNotNear /Peco Peco/
	Zeny >= 3500
	priority -3
	call {
		do move prontera 232 318 &rand(3,7)
	}
}

automacro pegarPeco {
	SkillLevel KN_CAVALIERMASTERY = 5
	exclusive 1
	StatusInactiveHandle EFST_RIDING
	NpcNear /Peco Peco/
	priority -3
	Zeny >= 3500
	call {
		do talk $.NpcNearLastBinId
		do talk resp 0
	}
}

automacro lockMap_foraDele {
	ConfigKey lockMap gl_church
	ConfigKeyNot attackAuto -1
	InLockMap 0
	exclusive 1
	call {
		do conf attackAuto -1
		do conf itemsTakeAuto 0
		do conf itemsGatherAuto 0
	}
}

automacro lockMap_dentroDele {
	ConfigKey lockMap gl_church
	ConfigKeyNot attackAuto 2
	InLockMap 1
	exclusive 1
	call {
		do conf attackAuto 2
		do conf itemsTakeAuto 2
		do conf itemsGatherAuto 2
	}
}

