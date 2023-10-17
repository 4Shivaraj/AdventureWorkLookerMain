connection: "adventureworksdwdb"

# include all the views

include: "/3_views/**/*.view.lkml"

datagroup: adventureworksdw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: adventureworksdw_default_datagroup


explore : dim_reseller {
  join: dim_geography {
    type: left_outer
    sql_on: ${dim_reseller.geography_key} = ${dim_geography.geography_key}  ;;
    relationship: many_to_one
  }
  hidden: yes
}

explore: dim_product {
  join: dim_product_subcategory {
    type: left_outer
    sql_on: ${dim_product.product_subcategory_key} = ${dim_product_subcategory.product_subcategory_key};;
    relationship: many_to_one
  }

  join: dim_product_category {
    type: left_outer
    sql_on: ${dim_product_subcategory.product_category_key} = ${dim_product_category.product_category_key} ;;
    relationship: many_to_one
  }
  hidden: yes
}

explore: fact_reseller_sales {
  join: dim_sales_territory {
    type: left_outer
    sql_on: ${fact_reseller_sales.sales_territory_key} = ${dim_sales_territory.sales_territory_key}  ;;
    relationship: many_to_one
  }

  join: dim_promotion {
  type: left_outer
  sql_on: ${fact_reseller_sales.promotion_key} = ${dim_promotion.promotion_key} ;;
    relationship: many_to_one
  }

  join: dim_reseller {
  type: left_outer
  sql_on: ${fact_reseller_sales.reseller_key} = ${dim_reseller.reseller_key} ;;
    relationship: many_to_one
  }

  join: dim_product {
    type: left_outer
    sql_on: ${fact_reseller_sales.product_key} = ${dim_product.product_key}  ;;
    relationship: many_to_one
  }

  join: dim_employee {
    type: left_outer
    sql_on: ${fact_reseller_sales.employee_key} = ${dim_employee.employee_key} ;;
    relationship: many_to_one
  }

  join: dim_date {
    type: left_outer
    sql_on: ${fact_reseller_sales.due_date_key} = ${dim_date.date_key} ;;
    relationship: many_to_one
  }

  join: order_date {
    type: left_outer
    sql_on: ${fact_reseller_sales.order_date_key} = ${dim_date.date_key} ;;
    relationship: many_to_one
    from: dim_date
  }

  join: ship_date {
    type: left_outer
    sql_on: ${fact_reseller_sales.ship_date_key} = ${dim_date.date_key} ;;
    relationship: many_to_one
    from: dim_date
  }

  join: dim_currency {
    type: left_outer
    sql_on: ${fact_reseller_sales.currency_key} = ${dim_currency.currency_key} ;;
    relationship: many_to_one
  }

}
