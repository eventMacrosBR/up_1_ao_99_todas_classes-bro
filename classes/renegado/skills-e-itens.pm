sub configurarSkillsEItens {
    # Furto
    configurarAttackSkill('TF_STEAL',10,'>= 10','','whenStatusInactive EFST_POSTDELAY');
    # Afanar
    configurarAttackSkill('RG_STEALCOIN',10,'>= 15','','whenStatusInactive EFST_POSTDELAY');
    # Desintoxicar
    configurarSelfSkill('TF_DETOXIFY', 1, '>= 10', 'whenStatusActive HEALTHSTATE_POISON', '');
    # Poção Laranja
    configurarSelfItem(502, '', '< 50%', '');
}