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
    sql_on: inner join ${dim_reseller.geography_key} = ${dim_geography.geography_key}  ;;
    relationship: many_to_one
  }
  hidden: yes
}

explore: dim_product {
  join: dim_product_subcategory {
    sql_on: ${dim_product.product_subcategory_key} = ${dim_product_subcategory.product_subcategory_key};;
    relationship: many_to_one
  }

  join: dim_product_category {
    sql_on: ${dim_product_category.product_category_key} = ${dim_product_subcategory.product_category_key} ;;
    relationship: many_to_one
  }
  hidden: yes
}

explore: fact_reseller_sales {
  join: dim_sales_territory {
    sql_on: inner join ${dim_sales_territory.sales_territory_key} = ${fact_reseller_sales.sales_territory_key}  ;;
    relationship: many_to_one
  }

  join: dim_reseller {
    sql_on: inner join ${dim_reseller.reseller_key} = ${fact_reseller_sales.reseller_key} ;;
    relationship: many_to_one
  }

  join: dim_product {
    sql_on: inner join ${dim_product.product_key} = ${fact_reseller_sales.product_key} ;;
    relationship: many_to_one
  }

  join: dim_employee {
    sql_on: inner join ${dim_employee.employee_key} = ${fact_reseller_sales.employee_key} ;;
    relationship: many_to_one
  }
}

explore: dim_date{}
