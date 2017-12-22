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
		adicionaUseSelfItem()
		do reload config
		do conf useSelf_item_1 504 #Poção Branca
		do conf useSelf_item_1_hp < 60%
		do conf useSelf_item_1_disabled 0
	}
}

