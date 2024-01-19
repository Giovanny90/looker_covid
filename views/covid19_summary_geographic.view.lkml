
view: covid19_summary_geographic {
  derived_table: {
    sql: SELECT confirmed_cases, countries_and_territories, daily_confirmed_cases, deaths, daily_deaths, year, month FROM `interno-davinci-analitica.capacitaciones.covid_19_geographic_distribution_worldwide` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: confirmed_cases {
    type: number
    sql: ${TABLE}.confirmed_cases ;;
  }

  dimension: countries_and_territories {
    type: string
    sql: ${TABLE}.countries_and_territories ;;
  }

  dimension: daily_confirmed_cases {
    type: number
    sql: ${TABLE}.daily_confirmed_cases ;;
  }

  dimension: deaths {
    type: number
    sql: ${TABLE}.deaths ;;
  }

  dimension: daily_deaths {
    type: number
    sql: ${TABLE}.daily_deaths ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
        confirmed_cases,
	countries_and_territories,
	daily_confirmed_cases,
	deaths,
	daily_deaths,
	year,
	month
    ]
  }
}
