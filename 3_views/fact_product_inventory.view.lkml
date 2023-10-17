view: fact_product_inventory {
  sql_table_name: dbo.FactProductInventory ;;

  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }
  dimension_group: movement {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MovementDate ;;
  }
  dimension: product_key {
    type: number
    sql: ${TABLE}.ProductKey ;;
  }
  dimension: unit_cost {
    type: string
    sql: ${TABLE}.UnitCost ;;
  }
  dimension: units_balance {
    type: number
    sql: ${TABLE}.UnitsBalance ;;
  }
  dimension: units_in {
    type: number
    sql: ${TABLE}.UnitsIn ;;
  }
  dimension: units_out {
    type: number
    sql: ${TABLE}.UnitsOut ;;
  }
  measure: count {
    type: count
  }
}
