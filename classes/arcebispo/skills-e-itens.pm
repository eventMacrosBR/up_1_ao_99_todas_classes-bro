automacro configurarCurar {
	SkillLevel AL_HEAL >= 2
	ConfigKeyNot useSelf_skill_0 AL_HEAL
	exclusive 1
	call {
		[
		log ===========================================
		log =Já tenho a skill Curar,
		log =Configurando ela
		log ===========================================
		]
		do conf useSelf_skill_0 AL_HEAL
		do conf useSelf_skill_0_lvl 10
		do conf useSelf_skill_0_hp < 70%
		do conf useSelf_skill_0_whenStatusInactive EFST_POSTDELAY
		do conf useSelf_skill_0_disabled 0
	}
}

automacro configurarAL_INCAGI {
	SkillLevel AL_INCAGI >= 1
	ConfigKeyNot useSelf_skill_1 AL_INCAGI
	exclusive 1
	call {
		[
		log ===========================================
		log =Já tenho a skill Aumentar Agilidade,
		log =Configurando ela
		log ===========================================
		]
		adicionaUseSelfSkill()
		do reload config
		do conf useSelf_skill_1 AL_INCAGI
		do conf useSelf_skill_1_lvl 10
		do conf useSelf_skill_1_sp >= 45
		do conf useSelf_skill_1_whenStatusInactive EFST_INC_AGI, EFST_POSTDELAY
		do conf useSelf_skill_1_notWhileSitting 1
		do conf useSelf_skill_1_notInTown 0
		do conf useSelf_skill_1_stopWhenHit 1
		do conf useSelf_skill_1_disabled 0
	}
}

automacro configurarAL_BLESSING {
	SkillLevel AL_BLESSING >= 1
	ConfigKeyNot useSelf_skill_2 AL_BLESSING
	exclusive 1
	call {
		[
		log ===========================================
		log =Já tenho a skill Bênção,
		log =Configurando ela
		log ===========================================
		]
		adicionaUseSelfSkill()
		do reload config
		do conf useSelf_skill_2 AL_BLESSING
		do conf useSelf_skill_2_lvl 10
		do conf useSelf_skill_2_sp >= 64
		do conf useSelf_skill_2_whenStatusInactive EFST_BLESSING, EFST_POSTDELAY
		do conf useSelf_skill_2_notWhileSitting 1
		do conf useSelf_skill_2_notInTown 1
		do conf useSelf_skill_2_disabled 0
	}
}

automacro configurarAL_ANGELUS {
	SkillLevel OUTRA_SKILL >= 1
	ConfigKeyNot useSelf_skill_3 AL_ANGELUS
	exclusive 1
	call {
		[
		log ===========================================
		log =Já tenho a skill Angelus,
		log =Configurando ela
		log ===========================================
		]
		adicionaUseSelfSkill()
		do reload config
		do conf useSelf_skill_3 AL_ANGELUS
		do conf useSelf_skill_3_lvl 10
		do conf useSelf_skill_3_sp >= 50
		do conf useSelf_skill_3_whenStatusInactive EFST_ANGELUS, EFST_POSTDELAY
		do conf useSelf_skill_3_notWhileSitting 1
		do conf useSelf_skill_3_notInTown 1
		do conf useSelf_skill_3_stopWhenHit 1
		do conf useSelf_skill_3_disabled 0
	}
}

automacro diminuirPorcentagemHpAgoraQueTenhoCurar {
	SkillLevel AL_HEAL >= 5
	ConfigKey useSelf_item_0 Poção de Aprendiz
	ConfigKeyNot useSelf_item_0_hp <= 20%
	exclusive 1
	call {
	   do conf useSelf_item_0_hp <= 20%
	}
}

