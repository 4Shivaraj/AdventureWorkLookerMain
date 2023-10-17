view: dim_sales_territory {
  sql_table_name: dbo.DimSalesTerritory ;;

  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }
  dimension: sales_territory_alternate_key {
    type: number
    sql: ${TABLE}.SalesTerritoryAlternateKey ;;
  }
  dimension: sales_territory_region {
    type: string
    sql: ${TABLE}.SalesTerritoryRegion ;;
  }
  dimension: sales_territory_country {
    type: string
    sql: ${TABLE}.SalesTerritoryCountry ;;
  }
  dimension: sales_territory_group {
    type: string
    sql: ${TABLE}.SalesTerritoryGroup ;;
  }
  dimension: sales_territory_image {
    type: string
    sql: ${TABLE}.SalesTerritoryImage ;;
    hidden: yes
  }
  measure: count {
    type: count
  }
}
