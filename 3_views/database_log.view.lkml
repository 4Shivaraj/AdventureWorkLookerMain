view: database_log {
  sql_table_name: dbo.DatabaseLog ;;

  dimension: database_log_id {
    type: number
    sql: ${TABLE}.DatabaseLogID ;;
  }
  dimension: database_user {
    type: string
    sql: ${TABLE}.DatabaseUser ;;
  }
  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }
  dimension: object {
    type: string
    sql: ${TABLE}.Object ;;
  }
  dimension_group: post {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.PostTime ;;
  }
  dimension: schema {
    type: string
    sql: ${TABLE}."Schema" ;;
  }
  dimension: tsql {
    type: string
    sql: ${TABLE}.TSQL ;;
  }
  dimension: xml_event {
    type: string
    sql: ${TABLE}.XmlEvent ;;
  }
  measure: count {
    type: count
  }
}
