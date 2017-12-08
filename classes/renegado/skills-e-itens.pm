macro configurarSkillsEItens {
    # Furto
    call configurarAttackSkill "TF_STEAL" "10" ">= 10" "" "whenStatusInactive EFST_POSTDELAY"
    # Afanar
    call configurarAttackSkill('RG_STEALCOIN',10,'>= 15','','whenStatusInactive EFST_POSTDELAY"
    # Desintoxicar
    call configurarSelfSkill "TF_DETOXIFY" "1" ">= 10" "whenStatusActive HEALTHSTATE_POISON" ""
    # Poção Laranja
    call configurarSelfItem "502" "" "< 50%" ""
}
