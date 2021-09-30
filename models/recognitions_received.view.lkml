view: recognitions_received {
  sql_table_name: "RS"."RECOGNITIONS_RECEIVED"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: badge {
    type: string
    sql: ${TABLE}."BADGE" ;;
  }

  dimension: cid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREATED" ;;
    html: {{ rendered_value | date: "%m/%d/%Y" }} ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}."MESSAGE" ;;
  }

  dimension: metadata_likes {
    type: number
    sql: ${TABLE}."METADATA_LIKES" ;;
  }

  dimension: metadata_replies {
    type: number
    sql: ${TABLE}."METADATA_REPLIES" ;;
  }

  dimension: recipient_emp_id {
    type: number
    sql: ${TABLE}."RECIPIENT_EMP_ID" ;;
  }

  dimension: recipient_username {
    type: string
    sql: ${TABLE}."RECIPIENT_USERNAME" ;;
  }

  dimension: rid {
    type: number
    value_format_name: id
    sql: ${TABLE}."RID" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, recipient_username]
  }
}
