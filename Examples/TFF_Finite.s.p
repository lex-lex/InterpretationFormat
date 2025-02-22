%------------------------------------------------------------------------------
tff(human_type,type,      human: $tType ).
tff(cat_type,type,        cat: $tType ).
tff(jon_decl,type,        jon: human ).
tff(garfield_decl,type,   garfield: cat ).
tff(arlene_decl,type,     arlene: cat ).
tff(nermal_decl,type,     nermal: cat ).
tff(loves_decl,type,      loves: cat > cat ).
tff(owns_decl,type,       owns: ( human * cat ) > $o ).

tff(d_human_type,type,    d_human: $tType ).
tff(d_cat_type,type,      d_cat: $tType ).
tff(d2human_decl,type,    d2human: d_human > human ).
tff(d2cat_decl,type,      d2cat: d_cat > cat ).
tff(d_jon_decl,type,      d_jon: d_human ).
tff(d_garfield_decl,type, d_garfield: d_cat ).
tff(d_arlene_decl,type,   d_arlene: d_cat ).
tff(d_nermal_decl,type,   d_nermal: d_cat ).

tff(garfield,axiom,
    ( ( ! [H: human] : ? [DH: d_human] : H = d2human(DH)
      & ! [DH: d_human] : ( DH = d_jon )
      & ! [DH1: d_human,DH2: d_human] :
          ( d2human(DH1) = d2human(DH2) => DH1 = DH2 )
      & ! [C: cat] : ? [DC: d_cat] : C = d2cat(DC)
      & ! [DC: d_cat]: 
          ( DC = d_garfield | DC = d_arlene | DC = d_nermal )
      & $distinct(d_garfield,d_arlene,d_nermal)
      & ! [DC1: d_cat,DC2: d_cat] : 
          ( d2cat(DC1) = d2cat(DC2) => DC1 = DC2 ) )
    & ( jon = d2human(d_jon)
      & garfield = d2cat(d_garfield)
      & arlene = d2cat(d_arlene)
      & nermal = d2cat(d_nermal)
      & loves(d2cat(d_garfield)) = d2cat(d_garfield)
      & loves(d2cat(d_arlene)) = d2cat(d_garfield)
      & loves(d2cat(d_nermal)) = d2cat(d_garfield) )
    & ( owns(d2human(d_jon),d2cat(d_garfield))
      & ~ owns(d2human(d_jon),d2cat(d_arlene))
      & ~ owns(d2human(d_jon),d2cat(d_nermal)) ) ) ).

tff(verify,conjecture,
    ( ! [H: human] : H = jon
    & ! [C: cat] : ( C = garfield | C = arlene | C = nermal )
    & ( garfield != arlene & garfield != nermal & arlene != nermal )
    & ( owns(jon,garfield) & ~ owns(jon,arlene) )
    & ! [C: cat] : ( loves(C) = garfield )
    & ~ ! [C: cat] :
          ( ( loves(C) = garfield & C != arlene)
         => owns(jon,C) ) ) ).
%------------------------------------------------------------------------------
