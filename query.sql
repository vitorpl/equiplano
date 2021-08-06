SELECT PARC.DATADEVENCIMENTO, 
       PARC.STPARCELA, 
       PARC.TPLANCAMENTOISSQN,
       PV.DTVENCIMENTO
  FROM STM_PARCELA PARC 
  JOIN STM_PARCELAVENCIMENTO PV ON PV.IDPARCELA = PARC.IDPARCELA
 WHERE PARC.IDLANCAMENTO
 IN (SELECT LANC.IDLANCAMENTO 
       FROM STM_LANCAMENTO LANC
       JOIN STM_EMPRESA EMP ON EMP.IDEMPRESA = LANC.IDEMPRESA
      WHERE EMP.NRINSCRICAOEMPRESA = 6386) --INFORME A INSCRICAO DA EMPRESA
 AND STPARCELA = 1 --ABERTA
 AND PARC.DATADEVENCIMENTO <= TO_DATE('06/08/21', 'DD/MM/YY')
 AND TPLANCAMENTOISSQN IN (0,1,2,3,4,5,7,8,10,13,16,17,21)
and parc.idparcela = 29462450
 ORDER BY PARC.DATADEVENCIMENTO DESC
