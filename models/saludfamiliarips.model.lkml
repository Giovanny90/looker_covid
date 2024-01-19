connection: "demo-saludfamiliarips"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: saludfamiliarips_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: saludfamiliarips_default_datagroup

# NOTE: please see https://cloud.google.com/looker/docs/r/sql/bigquery?version=23.20
# NOTE: for BigQuery specific considerations

explore: events {
  join: users {
    type: left_outer #_each
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer #_each
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer #_each
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers {}

explore: users {}

explore: casos_positivos_por_ano {}

explore: covid19_por_pais {}

explore: order_items {
  join: users {
    type: left_outer #_each
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer #_each
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer #_each
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer #_each
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer #_each
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer #_each
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer #_each
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
