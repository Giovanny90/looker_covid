
view: sql_runner_query {
  derived_table: {
    sql: SELECT countries_and_territories, SUM(confirmed_cases) as casos_confirmados,SUM(daily_confirmed_cases) as casos_muertos, SUM(daily_confirmed_cases)/SUM(confirmed_cases) *100 as porcentaje_muertes_casos_confirmados FROM [interno-davinci-analitica:capacitaciones.covid_19_geographic_distribution_worldwide] 
      GROUP BY 1 ORDER BY 4 DESC ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: countries_and_territories {
    type: string
    sql: ${TABLE}.countries_and_territories ;;
  }

  dimension: casos_confirmados {
    type: number
    sql: ${TABLE}.casos_confirmados ;;
  }

  dimension: casos_muertos {
    type: number
    sql: ${TABLE}.casos_muertos ;;
  }

  dimension: porcentaje_muertes_casos_confirmados {
    type: number
    sql: ${TABLE}.porcentaje_muertes_casos_confirmados ;;
  }

  set: detail {
    fields: [
        countries_and_territories,
	casos_confirmados,
	casos_muertos,
	porcentaje_muertes_casos_confirmados
    ]
  }
}
