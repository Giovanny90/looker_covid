
view: casos_positivos_por_ano {
  derived_table: {
    sql: SELECT [year], SUM(confirmed_cases) cases_year FROM [interno-davinci-analitica:capacitaciones.covid_19_geographic_distribution_worldwide] group by 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: cases_year {
    type: number
    sql: ${TABLE}.cases_year ;;
  }

  set: detail {
    fields: [
        year,
	cases_year
    ]
  }
}
