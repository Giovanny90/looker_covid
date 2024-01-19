
view: covid19_por_pais {
  derived_table: {
    sql: SELECT countries_and_territories,confirmed_cases, deaths, daily_confirmed_cases, daily_deaths, pop_data_2019
      FROM [interno-davinci-analitica:capacitaciones.covid_19_geographic_distribution_worldwide] ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: countries_and_territories {
    type: string
    sql: ${TABLE}.countries_and_territories ;;
  }

  dimension: confirmed_cases {
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: daily_confirmed_cases {
    type: number
    sql: ${TABLE}.daily_confirmed_cases ;;
  }

  dimension: daily_deaths {
    type: number
    sql: ${TABLE}.daily_deaths ;;
  }

  dimension: pop_data_2019 {
    type: number
    sql: ${TABLE}.pop_data_2019 ;;
  }

  set: detail {
    fields: [
        countries_and_territories,
	confirmed_cases,
	deaths,
	daily_confirmed_cases,
	daily_deaths,
	pop_data_2019
    ]
  }
}
