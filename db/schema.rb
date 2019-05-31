# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190530145546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_banks", id: :serial, force: :cascade do |t|
    t.string "banco", limit: 3, null: false
    t.string "agencia", limit: 6, null: false
    t.string "conta_corrente", limit: 10, null: false
    t.string "favorecido", limit: 100, null: false
    t.string "cpf_cnpj", limit: 18
    t.integer "account_id"
    t.string "contact_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nome_banco", limit: 65
    t.integer "tipo_operacao"
    t.decimal "valor", precision: 10, scale: 2
  end

  create_table "account_payables", id: :serial, force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "cost_center_id"
    t.integer "sub_cost_center_id"
    t.integer "historic_id"
    t.date "data_vencimento", null: false
    t.string "documento", limit: 20, null: false
    t.decimal "valor", precision: 10, scale: 2, default: "0.0", null: false
    t.text "observacao", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "payment_method_id"
    t.integer "type_account"
    t.string "supplier_type", limit: 255
    t.integer "cash_account_id"
    t.integer "ordem_service_id"
    t.integer "ordem_service_type_service_id"
    t.integer "sub_cost_center_three_id"
    t.integer "boarding_id"
    t.integer "count_email", default: 0
    t.index ["boarding_id"], name: "index_account_payables_on_boarding_id"
    t.index ["cost_center_id"], name: "index_account_payables_on_cost_center_id"
    t.index ["historic_id"], name: "index_account_payables_on_historic_id"
    t.index ["ordem_service_id"], name: "index_account_payables_on_ordem_service_id"
    t.index ["ordem_service_type_service_id"], name: "index_account_payables_on_ordem_service_type_service_id"
    t.index ["payment_method_id"], name: "index_account_payables_on_payment_method_id"
    t.index ["sub_cost_center_id"], name: "index_account_payables_on_sub_cost_center_id"
    t.index ["sub_cost_center_three_id"], name: "index_account_payables_on_sub_cost_center_three_id"
    t.index ["supplier_id"], name: "index_account_payables_on_supplier_id"
  end

  create_table "account_receivables", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "cost_center_id"
    t.integer "sub_cost_center_id"
    t.integer "historic_id"
    t.date "data_vencimento", null: false
    t.string "documento", limit: 20, null: false
    t.decimal "valor", precision: 10, scale: 2, default: "0.0", null: false
    t.text "observacao"
    t.integer "status", default: 0, null: false
    t.integer "ordem_service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "billing_id"
    t.integer "payment_method_id"
    t.integer "sub_cost_center_three_id"
    t.integer "input_control_id"
    t.integer "type_account", default: 3
    t.string "client_type", limit: 255, default: "Client"
    t.integer "direct_charge_id"
    t.index ["billing_id"], name: "index_account_receivables_on_billing_id"
    t.index ["client_id"], name: "index_account_receivables_on_client_id"
    t.index ["cost_center_id"], name: "index_account_receivables_on_cost_center_id"
    t.index ["direct_charge_id"], name: "index_account_receivables_on_direct_charge_id"
    t.index ["historic_id"], name: "index_account_receivables_on_historic_id"
    t.index ["input_control_id"], name: "index_account_receivables_on_input_control_id"
    t.index ["ordem_service_id"], name: "index_account_receivables_on_ordem_service_id"
    t.index ["payment_method_id"], name: "index_account_receivables_on_payment_method_id"
    t.index ["sub_cost_center_id"], name: "index_account_receivables_on_sub_cost_center_id"
    t.index ["sub_cost_center_three_id"], name: "index_account_receivables_on_sub_cost_center_three_id"
  end

  create_table "action_inspectors", id: :serial, force: :cascade do |t|
    t.integer "input_control_id"
    t.string "number", limit: 255
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer "user_confirmed_id"
    t.datetime "updated_confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["input_control_id"], name: "index_action_inspectors_on_input_control_id"
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["descricao"], name: "index_activities_on_descricao", unique: true
  end

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "tipo", limit: 5, null: false
    t.string "logradouro", limit: 100, null: false
    t.string "bairro", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cidade", limit: 100, null: false
    t.string "cep", limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cep"], name: "index_addresses_on_cep", unique: true
  end

  create_table "advance_moneys", id: :serial, force: :cascade do |t|
    t.date "date_advance"
    t.string "number", limit: 255
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "antts", id: :serial, force: :cascade do |t|
    t.string "rntrc", limit: 255
    t.string "cpf_cnpj", limit: 255
    t.string "name", limit: 255
    t.date "date_expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "antts_vehicles", id: :serial, force: :cascade do |t|
    t.integer "antt_id"
    t.integer "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["antt_id"], name: "index_antts_vehicles_on_antt_id"
    t.index ["vehicle_id"], name: "index_antts_vehicles_on_vehicle_id"
  end

  create_table "assets", id: :serial, force: :cascade do |t|
    t.integer "asset_id"
    t.string "asset_type", limit: 255
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", id: :serial, force: :cascade do |t|
    t.string "banco", limit: 5, null: false
    t.string "nome", limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billings", id: :serial, force: :cascade do |t|
    t.date "data", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.integer "status", default: 0, null: false
    t.text "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "type_service_id"
    t.date "data_vencimento"
    t.text "observacao"
    t.index ["type_service_id"], name: "index_billings_on_type_service_id"
  end

  create_table "boarding_items", id: :serial, force: :cascade do |t|
    t.integer "boarding_id"
    t.integer "ordem_service_id"
    t.integer "delivery_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "row_order"
    t.index ["boarding_id"], name: "index_boarding_items_on_boarding_id"
    t.index ["ordem_service_id"], name: "index_boarding_items_on_ordem_service_id"
  end

  create_table "boarding_vehicles", id: :serial, force: :cascade do |t|
    t.integer "boarding_id"
    t.integer "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["boarding_id"], name: "index_boarding_vehicles_on_boarding_id"
    t.index ["vehicle_id"], name: "index_boarding_vehicles_on_vehicle_id"
  end

  create_table "boardings", id: :serial, force: :cascade do |t|
    t.integer "carrier_id"
    t.integer "driver_id"
    t.date "date_boarding"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
    t.decimal "value_boarding", precision: 10, scale: 2
    t.text "obs"
    t.decimal "safe_rctr_c", precision: 20, scale: 4
    t.decimal "safe_optional", precision: 20, scale: 4
    t.string "number_tranking", limit: 255
    t.integer "qtde_boarding"
    t.string "manifesto", limit: 20
    t.string "chave_manifesto", limit: 45
    t.integer "local_embarque"
    t.string "action_inspector", limit: 20
    t.string "place", limit: 255
    t.integer "qtde_pallets_shipped"
    t.integer "team"
    t.integer "hangar"
    t.integer "dock"
    t.datetime "start_time_boarding"
    t.datetime "finish_time_boarding"
    t.integer "started_user_id"
    t.integer "confirmed_user_id"
    t.text "oper_observation"
    t.boolean "driver_checkin", default: false
    t.string "driver_checkin_palce_horse", limit: 255
    t.string "driver_checkin_palce_cart_1", limit: 255
    t.string "driver_checkin_palce_cart_2", limit: 255
    t.datetime "driver_checkin_time"
    t.integer "driver_checkin_user_id"
    t.string "sealing", limit: 255
    t.string "sealing_two", limit: 255
    t.string "sealing_three", limit: 255
    t.integer "insurer_id"
    t.index ["carrier_id"], name: "index_boardings_on_carrier_id"
    t.index ["driver_id"], name: "index_boardings_on_driver_id"
    t.index ["insurer_id"], name: "index_boardings_on_insurer_id"
  end

  create_table "breakdowns", id: :serial, force: :cascade do |t|
    t.integer "nfe_xml_id"
    t.integer "product_id"
    t.integer "type_breakdown"
    t.integer "sobras", default: 0
    t.integer "faltas", default: 0
    t.integer "avarias", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "breakdown_id"
    t.string "breakdown_type", limit: 255
    t.string "unid_medida", limit: 255
    t.decimal "price", precision: 20, scale: 2
    t.decimal "ipi_tax", precision: 20, scale: 2
    t.decimal "ipi_value", precision: 20, scale: 2
    t.decimal "icms_tax", precision: 20, scale: 2
    t.decimal "icms_value", precision: 20, scale: 2
    t.decimal "base_calc", precision: 20, scale: 2
    t.decimal "price_total", precision: 20, scale: 2
    t.index ["breakdown_id", "breakdown_type"], name: "index_breakdowns_on_breakdown_id_and_breakdown_type"
    t.index ["nfe_xml_id"], name: "index_breakdowns_on_nfe_xml_id"
    t.index ["product_id"], name: "index_breakdowns_on_product_id"
  end

  create_table "brokers", id: :serial, force: :cascade do |t|
    t.string "cnpj", limit: 255
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budget_items", id: :serial, force: :cascade do |t|
    t.integer "budget_id"
    t.integer "product_id"
    t.integer "qtde"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["budget_id"], name: "index_budget_items_on_budget_id"
    t.index ["product_id"], name: "index_budget_items_on_product_id"
  end

  create_table "budgets", id: :serial, force: :cascade do |t|
    t.date "data"
    t.string "email", limit: 255
    t.string "nome", limit: 255
    t.string "fone", limit: 255
    t.string "estado_origem", limit: 255
    t.string "municipio_origem", limit: 255
    t.string "estado_destino", limit: 255
    t.string "municipio_destino", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cancellations", id: :serial, force: :cascade do |t|
    t.integer "solicitation_user_id"
    t.integer "authorization_user_id"
    t.integer "status", default: 0, null: false
    t.text "observacao"
    t.integer "cancellation_id"
    t.string "cancellation_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cancellation_id", "cancellation_type"], name: "index_cancellations_on_cancellation_id_and_cancellation_type"
  end

  create_table "carrier_credentials", id: :serial, force: :cascade do |t|
    t.integer "carrier_source_id"
    t.integer "carrier_credential_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", id: :serial, force: :cascade do |t|
    t.string "cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "inscricao_estadual", limit: 20
    t.string "inscricao_municipal", limit: 20
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "obs"
    t.boolean "partner"
    t.boolean "aereo"
    t.string "antt", limit: 20
    t.string "antt_categoria", limit: 5
  end

  create_table "cash_accounts", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 100
    t.integer "bank_id"
    t.string "agencia", limit: 6
    t.string "conta_corrente", limit: 10
    t.decimal "ted_doc", precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bank_id"], name: "index_cash_accounts_on_bank_id"
  end

  create_table "cashes", id: :serial, force: :cascade do |t|
    t.date "data", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.integer "tipo"
    t.integer "payment_method_id"
    t.integer "cost_center_id"
    t.integer "sub_cost_center_id"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "cash_account_id"
    t.integer "sub_cost_center_three_id"
    t.integer "account_payable_id"
    t.string "historico", limit: 250
    t.integer "account_receivable_id"
    t.index ["account_payable_id"], name: "index_cashes_on_account_payable_id"
    t.index ["account_receivable_id"], name: "index_cashes_on_account_receivable_id"
    t.index ["cash_account_id"], name: "index_cashes_on_cash_account_id"
    t.index ["cost_center_id"], name: "index_cashes_on_cost_center_id"
    t.index ["payment_method_id"], name: "index_cashes_on_payment_method_id"
    t.index ["sub_cost_center_id"], name: "index_cashes_on_sub_cost_center_id"
    t.index ["sub_cost_center_three_id"], name: "index_cashes_on_sub_cost_center_three_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkins", force: :cascade do |t|
    t.string "driver_cpf"
    t.string "driver_name"
    t.integer "operation_type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_horse"
    t.string "place_cart_1"
    t.string "place_cart_2"
    t.integer "operation_id"
    t.integer "door"
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "name", limit: 255
    t.string "uf", limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_discharges", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_source_id"
    t.integer "type_unit"
    t.integer "type_charge"
    t.integer "type_calc"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.integer "type_operation"
  end

  create_table "client_representatives", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "billing_client_id"
    t.index ["client_id"], name: "index_client_representatives_on_client_id"
    t.index ["representative_id"], name: "index_client_representatives_on_representative_id"
  end

  create_table "client_requirements", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_source_id"
    t.integer "type_vehicle"
    t.integer "type_body"
    t.integer "type_floor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.index ["client_id"], name: "index_client_requirements_on_client_id"
  end

  create_table "client_table_prices", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "type_service_id"
    t.integer "stretch_route_id"
    t.decimal "freight_weight", precision: 10, scale: 4, default: "0.0"
    t.decimal "freight_value", precision: 10, scale: 4, default: "0.0"
    t.decimal "freight_volume", precision: 10, scale: 4, default: "0.0"
    t.decimal "freight_dispatch", precision: 10, scale: 4, default: "0.0"
    t.decimal "freight_toll", precision: 10, scale: 4, default: "0.0"
    t.integer "freight_type_gris"
    t.decimal "freight_gris", precision: 10, scale: 4, default: "0.0"
    t.integer "freight_type_trt"
    t.decimal "freight_trt", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_total_freight", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_weiht", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_value", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_gris", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_trt", precision: 10, scale: 4, default: "0.0"
    t.decimal "minimum_weight_kg", precision: 10, scale: 4, default: "0.0"
    t.integer "collection_delivery_incidence"
    t.integer "collection_delivery_ad_icms_value_frete"
    t.integer "collection_delivery_ad_value_minimum"
    t.decimal "collection_delivery_icms_taxpayer", precision: 10, scale: 4, default: "0.0"
    t.decimal "collection_delivery_non_taxpayer", precision: 10, scale: 4, default: "0.0"
    t.decimal "collection_delivery_iss", precision: 10, scale: 4, default: "0.0"
    t.integer "use_aliquot_consumer_last"
    t.integer "validity_status"
    t.date "validity_start"
    t.date "validity_end"
    t.decimal "secure_rate", precision: 10, scale: 4, default: "0.0"
    t.decimal "secure_rate_filch", precision: 10, scale: 4, default: "0.0"
    t.decimal "secure_rate_aggravated", precision: 10, scale: 4, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "reset"
    t.decimal "payment_discharges", precision: 10, scale: 2, default: "0.0"
    t.decimal "margin_lucre", precision: 10, scale: 4, default: "0.0"
    t.integer "type_calc", default: 0
    t.integer "client_table_price_id"
    t.string "client_table_price_type", limit: 255
    t.index ["client_id"], name: "index_client_table_prices_on_client_id"
    t.index ["client_table_price_id", "client_table_price_type"], name: "idx_client_table_prices_polymorphic"
    t.index ["stretch_route_id"], name: "index_client_table_prices_on_stretch_route_id"
    t.index ["type_service_id"], name: "index_client_table_prices_on_type_service_id"
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "cpf_cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "inscricao_estadual", limit: 20
    t.string "inscricao_municipal", limit: 20
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.integer "tipo_pessoa", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "rg", limit: 20
    t.string "orgao_emissor", limit: 20
    t.date "data_emissao_rg"
    t.text "obs"
    t.string "hora_descarga", limit: 50
    t.text "condicao_recebimento"
    t.integer "group_client_id"
    t.decimal "valor_volume", precision: 10, scale: 3
    t.decimal "valor_peso", precision: 10, scale: 3
    t.boolean "faturar"
    t.boolean "capital"
    t.integer "faturar_cada"
    t.integer "vencimento_para"
    t.decimal "valor_peso_1500", precision: 10, scale: 3
    t.string "suframa", limit: 20
    t.integer "qtde_parcela"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.boolean "orgao_publico"
    t.boolean "icms_contribuinte"
    t.integer "tipo_cliente"
    t.boolean "accept_operational"
    t.boolean "client_credential_sefaz", default: false
    t.decimal "height_maximum_pallet_to_clients"
    t.integer "default_height_maximum_pallet_to_clients"
    t.decimal "default_height_maximum_pallet", precision: 10, scale: 2
    t.integer "type_height_maximum_pallet"
    t.index ["user_created_id"], name: "index_clients_on_user_created_id"
    t.index ["user_updated_id"], name: "index_clients_on_user_updated_id"
  end

  create_table "clients_pallets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "product_id"
    t.decimal "layer_pallet", precision: 10, scale: 2
    t.decimal "decimal", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "source_client_id"
    t.index ["client_id"], name: "index_clients_pallets_on_client_id"
    t.index ["product_id"], name: "index_clients_pallets_on_product_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.string "email_origem", limit: 255
    t.string "email_destino"
    t.text "content"
    t.integer "comment_id"
    t.string "comment_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "title"
    t.text "observation"
    t.index ["comment_id", "comment_type"], name: "index_comments_on_comment_id_and_comment_type"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "razao_social", limit: 255
    t.string "fantasia", limit: 255
    t.string "cnpj", limit: 255
    t.string "inscricao_estadual", limit: 255
    t.string "inscricao_municipal", limit: 255
    t.string "endereco", limit: 255
    t.string "numero", limit: 255
    t.string "complemento", limit: 255
    t.string "bairro", limit: 255
    t.string "cidade", limit: 255
    t.string "estado", limit: 255
    t.string "cep", limit: 255
    t.string "pais", limit: 255
    t.string "phone_first", limit: 255
    t.string "phone_second", limit: 255
    t.text "observacao"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "quitter_file_name", limit: 255
    t.string "quitter_content_type", limit: 255
    t.integer "quitter_file_size"
    t.datetime "quitter_updated_at"
  end

  create_table "config_systems", id: :serial, force: :cascade do |t|
    t.string "config_key", limit: 255
    t.string "config_value", limit: 255
    t.text "config_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.integer "tipo", null: false
    t.string "nome", limit: 30, null: false
    t.string "fone", limit: 15
    t.string "complemento", limit: 100
    t.integer "contact_id"
    t.string "contact_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "control_pallet_internals", id: :serial, force: :cascade do |t|
    t.string "responsable_type", limit: 255
    t.integer "responsable_id"
    t.integer "type_launche"
    t.date "date_launche"
    t.integer "qtde"
    t.string "historic", limit: 255
    t.text "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "type_account"
    t.integer "equipament"
    t.integer "boarding_id"
    t.index ["boarding_id"], name: "index_control_pallet_internals_on_boarding_id"
  end

  create_table "control_pallets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.date "data"
    t.integer "qte"
    t.integer "tipo"
    t.string "historico", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nfe", limit: 255
    t.string "nfd", limit: 255
    t.string "nfe_original", limit: 255
    t.string "nfd_original", limit: 255
    t.integer "carrier_id"
    t.integer "status", default: 0
    t.decimal "peso", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 3
    t.integer "input_control_id"
    t.boolean "generate_ordem_service"
    t.index ["carrier_id"], name: "index_control_pallets_on_carrier_id"
    t.index ["client_id"], name: "index_control_pallets_on_client_id"
    t.index ["input_control_id"], name: "index_control_pallets_on_input_control_id"
  end

  create_table "cost_centers", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cte_keys", id: :serial, force: :cascade do |t|
    t.string "cte", limit: 20, null: false
    t.string "chave", limit: 45
    t.integer "cte_id"
    t.string "cte_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "cte_xmls", id: :serial, force: :cascade do |t|
    t.integer "status"
    t.integer "error"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "current_accounts", id: :serial, force: :cascade do |t|
    t.integer "cash_account_id"
    t.date "data", null: false
    t.decimal "valor", null: false
    t.integer "tipo", null: false
    t.string "historico", limit: 250, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_payable_id"
    t.integer "account_receivable_id"
    t.index ["account_payable_id"], name: "index_current_accounts_on_account_payable_id"
    t.index ["account_receivable_id"], name: "index_current_accounts_on_account_receivable_id"
    t.index ["cash_account_id"], name: "index_current_accounts_on_cash_account_id"
  end

  create_table "direct_charges", id: :serial, force: :cascade do |t|
    t.integer "carrier_id"
    t.integer "driver_id"
    t.string "place", limit: 10, null: false
    t.string "place_cart", limit: 10
    t.string "place_cart_2", limit: 10
    t.date "date_charge"
    t.boolean "palletized", default: false
    t.integer "quantity_pallets"
    t.boolean "charge_discharge", default: true
    t.decimal "weight", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 3
    t.decimal "value_ton", precision: 20, scale: 4
    t.decimal "value_kg", precision: 20, scale: 4
    t.decimal "value_total", precision: 20, scale: 4
    t.integer "status", default: 0
    t.date "date_closing"
    t.text "observation"
    t.string "source_state", limit: 255
    t.string "source_city", limit: 255
    t.string "target_state", limit: 255
    t.string "target_city", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "shipment", limit: 30
    t.integer "offer_charge_id"
    t.integer "billing_client_id"
    t.integer "stretch_route_id"
    t.integer "type_service_id"
    t.integer "client_table_price_id"
    t.index ["carrier_id"], name: "index_direct_charges_on_carrier_id"
    t.index ["client_table_price_id"], name: "index_direct_charges_on_client_table_price_id"
    t.index ["driver_id"], name: "index_direct_charges_on_driver_id"
    t.index ["offer_charge_id"], name: "index_direct_charges_on_offer_charge_id"
    t.index ["stretch_route_id"], name: "index_direct_charges_on_stretch_route_id"
    t.index ["type_service_id"], name: "index_direct_charges_on_type_service_id"
    t.index ["user_id"], name: "index_direct_charges_on_user_id"
  end

  create_table "driver_restrictions", id: :serial, force: :cascade do |t|
    t.integer "driver_id"
    t.integer "client_id"
    t.integer "restriction"
    t.text "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
    t.index ["client_id"], name: "index_driver_restrictions_on_client_id"
    t.index ["driver_id"], name: "index_driver_restrictions_on_driver_id"
  end

  create_table "drivers", id: :serial, force: :cascade do |t|
    t.string "cpf", limit: 14, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.string "rg", limit: 20, null: false
    t.string "orgao_expeditor", limit: 20, null: false
    t.date "data_emissao_rg", null: false
    t.date "data_nascimento", null: false
    t.string "municipio_nascimento", limit: 100, null: false
    t.string "estado_nascimento", limit: 2, null: false
    t.string "inss", limit: 20
    t.string "cnh", limit: 20, null: false
    t.string "registro_cnh", limit: 20, null: false
    t.integer "categoria", null: false
    t.date "validade_cnh", null: false
    t.string "nome_do_pai", limit: 100
    t.string "nome_da_mae", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "avatar_file_name", limit: 255
    t.string "avatar_content_type", limit: 255
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "obs"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.integer "estado_civil"
    t.integer "cor_da_pele"
    t.integer "tipo_contrato"
    t.date "date_expiration_medical"
    t.date "date_query_secure"
    t.date "date_expiration_secure"
    t.string "number_secure", limit: 255
    t.string "number_mopp", limit: 255
    t.date "date_expiration_mopp"
    t.integer "owner_id"
    t.boolean "sync"
    t.index ["owner_id"], name: "index_drivers_on_owner_id"
    t.index ["user_created_id"], name: "index_drivers_on_user_created_id"
    t.index ["user_updated_id"], name: "index_drivers_on_user_updated_id"
  end

  create_table "drivings", id: :serial, force: :cascade do |t|
    t.integer "driver_id"
    t.integer "vehicle_id"
    t.integer "driving_id"
    t.string "driving_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["driver_id"], name: "index_drivings_on_driver_id"
    t.index ["vehicle_id"], name: "index_drivings_on_vehicle_id"
  end

  create_table "edi_queues", force: :cascade do |t|
    t.bigint "nfe_key_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nfe_key_id"], name: "index_edi_queues_on_nfe_key_id"
  end

  create_table "emails", id: :serial, force: :cascade do |t|
    t.string "setor", limit: 40, null: false
    t.string "contato", limit: 60, null: false
    t.string "email", limit: 100, null: false
    t.integer "email_id"
    t.string "email_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "responsavel_carga"
    t.boolean "comprovante"
    t.integer "sector_id"
    t.index ["sector_id"], name: "index_emails_on_sector_id"
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.string "cpf", limit: 14, null: false
    t.string "nome", limit: 100, null: false
    t.string "apelido", limit: 100, null: false
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.integer "tipo", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "rg", limit: 20
    t.string "orgao_emissor", limit: 20
    t.date "data_emissao_rg"
    t.string "avatar_file_name", limit: 255
    t.string "avatar_content_type", limit: 255
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "obs"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "controller_name", limit: 255
    t.string "action_name", limit: 255
    t.text "what"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "file_edis", id: :serial, force: :cascade do |t|
    t.string "type_file", limit: 255
    t.date "date_file"
    t.string "name_file", limit: 255
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date_boarding"
    t.integer "shipper_id"
    t.integer "carrier_id"
    t.string "place", limit: 255
    t.decimal "weight", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 3
    t.decimal "value_total", precision: 20, scale: 4
    t.integer "qtde"
    t.index ["carrier_id"], name: "index_file_edis_on_carrier_id"
    t.index ["shipper_id"], name: "index_file_edis_on_shipper_id"
  end

  create_table "file_occurrences", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.date "date_file"
    t.string "name_file", limit: 255
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_file_occurrences_on_client_id"
  end

  create_table "group_clients", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "value_weight"
    t.decimal "value_ton"
  end

  create_table "historics", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 255
    t.integer "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "input_controls", id: :serial, force: :cascade do |t|
    t.integer "carrier_id"
    t.integer "driver_id"
    t.string "place", limit: 10, null: false
    t.string "place_cart", limit: 10
    t.string "place_cart_2", limit: 10
    t.date "date_entry"
    t.time "time_entry"
    t.date "date_receipt"
    t.boolean "palletized"
    t.integer "quantity_pallets"
    t.decimal "weight", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 3
    t.decimal "value_ton", precision: 20, scale: 4
    t.decimal "value_kg", precision: 20, scale: 4
    t.decimal "value_total", precision: 20, scale: 4
    t.integer "status", default: 0, null: false
    t.date "date_closing"
    t.text "observation"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "received_user_id"
    t.boolean "charge_discharge", default: true
    t.string "shipment", limit: 30
    t.integer "team"
    t.integer "dock"
    t.integer "hangar"
    t.integer "billing_client_id"
    t.string "container", limit: 255
    t.integer "client_table_price_id"
    t.integer "stretch_route_id"
    t.integer "type_service_id"
    t.string "place_confirmed", limit: 255
    t.datetime "start_time_discharge"
    t.datetime "finish_time_discharge"
    t.integer "started_user_id"
    t.string "place_horse", limit: 255
    t.date "date_scheduled"
    t.time "time_scheduled"
    t.text "motive_scheduled"
    t.integer "charge_type_delivery"
    t.index ["carrier_id"], name: "index_input_controls_on_carrier_id"
    t.index ["client_table_price_id"], name: "index_input_controls_on_client_table_price_id"
    t.index ["driver_id"], name: "index_input_controls_on_driver_id"
    t.index ["stretch_route_id"], name: "index_input_controls_on_stretch_route_id"
    t.index ["type_service_id"], name: "index_input_controls_on_type_service_id"
    t.index ["user_id"], name: "index_input_controls_on_user_id"
  end

  create_table "insurers", id: :serial, force: :cascade do |t|
    t.string "cnpj", limit: 255
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internal_comments", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255
    t.text "content"
    t.string "comment_type", limit: 255
    t.integer "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["comment_id", "comment_type"], name: "idx_internal_comments_on_os_id_and_os_type"
  end

  create_table "inventories", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.string "descricao", limit: 50, null: false
    t.integer "qtde", null: false
    t.string "estado", limit: 30
    t.decimal "valor", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "numero", null: false
    t.index ["ordem_service_id"], name: "index_inventories_on_ordem_service_id"
  end

  create_table "item_direct_charges", force: :cascade do |t|
    t.bigint "direct_charge_id"
    t.bigint "product_id"
    t.bigint "nfe_xml_id"
    t.string "number_nfe"
    t.decimal "qtde"
    t.decimal "qtde_trib"
    t.string "unid_medida"
    t.decimal "valor", precision: 20, scale: 4
    t.decimal "valor_unitario", precision: 20, scale: 4
    t.decimal "valor_unitario_comer", precision: 20, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direct_charge_id"], name: "index_item_direct_charges_on_direct_charge_id"
    t.index ["nfe_xml_id"], name: "index_item_direct_charges_on_nfe_xml_id"
    t.index ["product_id"], name: "index_item_direct_charges_on_product_id"
  end

  create_table "item_input_controls", id: :serial, force: :cascade do |t|
    t.integer "input_control_id"
    t.integer "product_id"
    t.string "number_nfe", limit: 255
    t.decimal "qtde"
    t.decimal "qtde_trib"
    t.string "unid_medida", limit: 255
    t.decimal "valor", precision: 20, scale: 4
    t.decimal "valor_unitario", precision: 20, scale: 4
    t.decimal "valor_unitario_comer", precision: 20, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "nfe_xml_id"
    t.index ["input_control_id"], name: "index_item_input_controls_on_input_control_id"
    t.index ["nfe_xml_id"], name: "index_item_input_controls_on_nfe_xml_id"
    t.index ["product_id"], name: "index_item_input_controls_on_product_id"
  end

  create_table "item_ordem_services", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.integer "product_id"
    t.string "number", limit: 255
    t.decimal "qtde", precision: 10, scale: 4
    t.decimal "qtde_trib", precision: 20, scale: 4
    t.string "unid_medida", limit: 255
    t.decimal "valor", precision: 20, scale: 4
    t.decimal "valor_unitario_comer", precision: 20, scale: 10
    t.decimal "valor_unitario", precision: 20, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ordem_service_id"], name: "index_item_ordem_services_on_ordem_service_id"
    t.index ["product_id"], name: "index_item_ordem_services_on_product_id"
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "url", limit: 255
    t.text "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "row_order"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "lower_account_payables", id: :serial, force: :cascade do |t|
    t.integer "account_payable_id"
    t.date "data_pagamento", null: false
    t.decimal "valor_pago", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "juros", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "desconto", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_pago", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "cash_account_id"
    t.index ["account_payable_id"], name: "index_lower_account_payables_on_account_payable_id"
    t.index ["cash_account_id"], name: "index_lower_account_payables_on_cash_account_id"
  end

  create_table "lower_account_receivables", id: :serial, force: :cascade do |t|
    t.integer "account_receivable_id"
    t.integer "cash_account_id"
    t.date "data_pagamento", null: false
    t.decimal "valor_pago", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "juros", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "desconto", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_pago", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_receivable_id"], name: "index_lower_account_receivables_on_account_receivable_id"
    t.index ["cash_account_id"], name: "index_lower_account_receivables_on_cash_account_id"
  end

  create_table "meetings", id: :serial, force: :cascade do |t|
    t.date "date_event"
    t.time "time_event"
    t.string "local", limit: 255
    t.string "summoned", limit: 255
    t.string "facilitator", limit: 255
    t.string "secretary", limit: 255
    t.text "objective"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "micro_regions", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "micro_regions_cities", id: :serial, force: :cascade do |t|
    t.integer "micro_region_id"
    t.integer "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["city_id"], name: "index_micro_regions_cities_on_city_id"
    t.index ["micro_region_id"], name: "index_micro_regions_cities_on_micro_region_id"
  end

  create_table "movement_activities", id: :serial, force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "activity_id"
    t.integer "movement_activity_id"
    t.string "movement_activity_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_id"], name: "index_movement_activities_on_activity_id"
    t.index ["supplier_id"], name: "index_movement_activities_on_supplier_id"
  end

  create_table "nature_freights", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nfe_keys", id: :serial, force: :cascade do |t|
    t.string "nfe", limit: 20, null: false
    t.string "chave", limit: 45
    t.integer "nfe_id"
    t.string "nfe_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "qtde", default: 0
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.string "remessa_ype", limit: 30
    t.decimal "volume", precision: 10, scale: 3
    t.decimal "peso", precision: 10, scale: 3
    t.string "nfe_source_type", limit: 255
    t.text "observation"
    t.decimal "average", precision: 20, scale: 4, default: "0.0"
    t.string "action_inspector_number", limit: 255
    t.string "action_inspector_file_name", limit: 255
    t.string "action_inspector_content_type", limit: 255
    t.integer "action_inspector_file_size"
    t.datetime "action_inspector_updated_at"
    t.integer "action_inspector_user_confirmed_id"
    t.datetime "action_inspector_updated_confirmed"
    t.boolean "take_dae"
    t.integer "retained", default: 0
    t.integer "motive_id"
    t.text "motive_observation"
    t.integer "retained_created_user_id"
    t.integer "qtde_pallet"
  end

  create_table "nfe_xmls", id: :serial, force: :cascade do |t|
    t.integer "status"
    t.integer "error"
    t.string "asset_file_name", limit: 255
    t.string "asset_content_type", limit: 255
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "nfe_id"
    t.string "nfe_type", limit: 255
    t.decimal "peso", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 3
    t.string "numero", limit: 255
    t.string "chave", limit: 45
    t.integer "source_client_id"
    t.integer "target_client_id"
    t.decimal "valor_nota", precision: 20, scale: 4
    t.integer "equipamento"
    t.integer "create_os"
    t.decimal "peso_liquido", precision: 10, scale: 3
    t.text "observation"
    t.string "place", limit: 255
    t.string "action_inspector_number", limit: 255
    t.string "action_inspector_file_name", limit: 255
    t.string "action_inspector_content_type", limit: 255
    t.integer "action_inspector_file_size"
    t.datetime "action_inspector_updated_at"
    t.integer "action_inspector_user_confirmed_id"
    t.datetime "action_inspector_updated_confirmed"
    t.boolean "take_dae"
    t.integer "qtde_pallet"
    t.date "issue_date"
    t.bigint "carrier_id"
    t.index ["carrier_id"], name: "index_nfe_xmls_on_carrier_id"
  end

  create_table "nfs_keys", id: :serial, force: :cascade do |t|
    t.string "nfs", limit: 20, null: false
    t.string "chave", limit: 45
    t.integer "nfs_id"
    t.string "nfs_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notfis", id: :serial, force: :cascade do |t|
    t.string "place", limit: 255
    t.integer "client_id"
    t.date "date_notfis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "file_edi_id"
    t.index ["client_id"], name: "index_notfis_on_client_id"
    t.index ["file_edi_id"], name: "index_notfis_on_file_edi_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action", limit: 255
    t.integer "notifiable_id"
    t.string "notifiable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occurrences", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date_occurrence"
    t.string "number_nfe", limit: 255
    t.integer "motive_id"
    t.text "observation"
    t.integer "file_occurrence_id"
    t.integer "nfe_key_id"
    t.index ["file_occurrence_id"], name: "index_occurrences_on_file_occurrence_id"
    t.index ["nfe_key_id"], name: "index_occurrences_on_nfe_key_id"
  end

  create_table "offer_charges", id: :serial, force: :cascade do |t|
    t.string "shipper", limit: 255
    t.date "date_shipment"
    t.time "time_shipment"
    t.string "shipping", limit: 255
    t.string "local_loading", limit: 255
    t.string "type_vehicle", limit: 255
    t.string "vehicle_detail", limit: 255
    t.integer "vehicle_situation"
    t.decimal "freight_min", precision: 10, scale: 3
    t.decimal "freight_max", precision: 10, scale: 3
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "local_landing", limit: 255
    t.integer "direct_charge_id"
    t.boolean "palletized"
    t.index ["direct_charge_id"], name: "index_offer_charges_on_direct_charge_id"
    t.index ["user_id"], name: "index_offer_charges_on_user_id"
  end

  create_table "offer_drivers", id: :serial, force: :cascade do |t|
    t.integer "offer_charge_id"
    t.date "date_incoming"
    t.time "time_incoming"
    t.string "driver", limit: 255
    t.string "type_vehicle", limit: 255
    t.string "place_horse", limit: 255
    t.string "place_cart_first", limit: 255
    t.string "place_cart_second", limit: 255
    t.integer "status"
    t.text "observation"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["offer_charge_id"], name: "index_offer_drivers_on_offer_charge_id"
    t.index ["user_id"], name: "index_offer_drivers_on_user_id"
  end

  create_table "offer_items", id: :serial, force: :cascade do |t|
    t.integer "offer_charge_id"
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "client", limit: 255
    t.date "date_schedule"
    t.time "time_schedule"
    t.integer "qtde_pallets"
    t.decimal "volume", precision: 10, scale: 3
    t.decimal "weight", precision: 10, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["offer_charge_id"], name: "index_offer_items_on_offer_charge_id"
  end

  create_table "operating_employees", id: :serial, force: :cascade do |t|
    t.integer "operating_id"
    t.integer "employee_id"
    t.decimal "valor_diaria", precision: 10, scale: 2, null: false
    t.decimal "valor_almoco", precision: 10, scale: 2, null: false
    t.decimal "valor_transporte", precision: 10, scale: 2, null: false
    t.decimal "valor_extra", precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_operating_employees_on_employee_id"
    t.index ["operating_id"], name: "index_operating_employees_on_operating_id"
  end

  create_table "operating_items", id: :serial, force: :cascade do |t|
    t.integer "operating_id"
    t.integer "product_id"
    t.integer "qtde"
    t.string "unidade", limit: 3
    t.decimal "valor", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["operating_id"], name: "index_operating_items_on_operating_id"
    t.index ["product_id"], name: "index_operating_items_on_product_id"
  end

  create_table "operating_services", id: :serial, force: :cascade do |t|
    t.integer "operating_id"
    t.integer "type_service_id"
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["operating_id"], name: "index_operating_services_on_operating_id"
    t.index ["type_service_id"], name: "index_operating_services_on_type_service_id"
  end

  create_table "operatings", id: :serial, force: :cascade do |t|
    t.integer "driver_id"
    t.integer "client_id"
    t.date "data_chegada"
    t.string "placa", limit: 10
    t.string "cte", limit: 20
    t.string "danfe", limit: 20
    t.decimal "qtde_volume", precision: 10, scale: 2
    t.decimal "peso", precision: 10, scale: 2
    t.text "observacao"
    t.string "chave_cte", limit: 45
    t.string "chave_nfe", limit: 45
    t.string "responsavel_recebimento", limit: 50
    t.text "informacao_agendamento"
    t.text "informacao_operacional"
    t.string "responsavel_descarga", limit: 50
    t.decimal "valor", precision: 10, scale: 2
    t.integer "fpgto"
    t.boolean "avaria"
    t.date "data_devolucao"
    t.text "motivo_devolucao"
    t.string "danfe_devolucao", limit: 42
    t.text "observacao_edvolucao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "chave_danfe_devolucao", limit: 45
    t.integer "status"
    t.index ["client_id"], name: "index_operatings_on_client_id"
    t.index ["driver_id"], name: "index_operatings_on_driver_id"
  end

  create_table "ordem_service_airs", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.integer "source_stretch_id"
    t.integer "target_stretch_id"
    t.integer "target_agent_id"
    t.integer "airline_carrier_id"
    t.string "solicitante", limit: 255
    t.string "awb", limit: 20
    t.string "voo", limit: 10
    t.date "previsao"
    t.integer "tipo_frete"
    t.integer "qtde_volume"
    t.decimal "peso", precision: 10, scale: 2
    t.decimal "valor_nf", precision: 10, scale: 2
    t.decimal "total_cubagem", precision: 10, scale: 2
    t.decimal "tarifa_companhia", precision: 10, scale: 2
    t.decimal "valor_total", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ordem_service_id"], name: "index_ordem_service_airs_on_ordem_service_id"
  end

  create_table "ordem_service_changes", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.string "source_cep", limit: 255
    t.string "source_numero", limit: 255
    t.string "source_complemento", limit: 255
    t.string "source_endereco_completo", limit: 255
    t.string "source_endereco", limit: 255
    t.string "source_bairro", limit: 255
    t.string "source_cidade", limit: 255
    t.string "source_estado", limit: 255
    t.string "source_contato", limit: 255
    t.string "target_cep", limit: 255
    t.string "target_numero", limit: 255
    t.string "target_complemento", limit: 255
    t.string "target_endereco_completo", limit: 255
    t.string "target_endereco", limit: 255
    t.string "target_bairro", limit: 255
    t.string "target_cidade", limit: 255
    t.string "target_estado", limit: 255
    t.string "target_contato", limit: 255
    t.string "placa", limit: 255
    t.integer "driver_id"
    t.boolean "compartilhado"
    t.decimal "cubagem"
    t.decimal "valor_declarado"
    t.decimal "valor_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "dias", default: 0
    t.index ["driver_id"], name: "index_ordem_service_changes_on_driver_id"
    t.index ["ordem_service_id"], name: "index_ordem_service_changes_on_ordem_service_id"
  end

  create_table "ordem_service_logistics", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.integer "driver_id"
    t.integer "delivery_driver_id"
    t.string "placa", limit: 10, null: false
    t.string "senha_sefaz", limit: 15
    t.decimal "qtde_volume", precision: 10, scale: 3
    t.decimal "decimal", precision: 10, scale: 2
    t.decimal "peso", precision: 10, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "qtde_palets"
    t.index ["driver_id"], name: "index_ordem_service_logistics_on_driver_id"
    t.index ["ordem_service_id"], name: "index_ordem_service_logistics_on_ordem_service_id"
  end

  create_table "ordem_service_table_prices", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.integer "type_service_id"
    t.integer "ordem_service_type_service_id"
    t.integer "client_table_price_id"
    t.decimal "iss_tax", precision: 20, scale: 4, default: "0.0"
    t.decimal "iss_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "margin_lucre_tax", precision: 20, scale: 4, default: "0.0"
    t.decimal "margin_lucre_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "total_service", precision: 20, scale: 4, default: "0.0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "freight_weight_tax", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_weight_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_value_tax", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_volume_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_volume_tax", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_icms_value", precision: 20, scale: 4, default: "0.0"
    t.decimal "freight_icms_tax", precision: 20, scale: 4, default: "0.0"
    t.index ["client_table_price_id"], name: "os_table_price_client_table_price"
    t.index ["ordem_service_id"], name: "os_table_price_os_type_service"
    t.index ["ordem_service_type_service_id"], name: "table_price_os_service"
    t.index ["type_service_id"], name: "os_type_service_os_type_service"
  end

  create_table "ordem_service_type_services", id: :serial, force: :cascade do |t|
    t.integer "ordem_service_id"
    t.integer "type_service_id"
    t.decimal "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "qtde", default: 0
    t.integer "qtde_recebida", default: 0
    t.decimal "valor_pago", precision: 10, scale: 2
    t.integer "status", default: 0
    t.string "advance_money_number", limit: 255
    t.integer "client_table_price_id"
    t.integer "status_login"
    t.integer "stretch_route_id"
    t.index ["client_table_price_id"], name: "index_ordem_service_type_services_on_client_table_price_id"
    t.index ["ordem_service_id"], name: "index_ordem_service_type_services_on_ordem_service_id"
    t.index ["stretch_route_id"], name: "index_ordem_service_type_services_on_stretch_route_id"
    t.index ["type_service_id"], name: "index_ordem_service_type_services_on_type_service_id"
  end

  create_table "ordem_services", id: :serial, force: :cascade do |t|
    t.integer "driver_id"
    t.integer "target_client_id"
    t.date "data"
    t.string "placa", limit: 10
    t.string "estado", limit: 2, null: false
    t.string "cidade", limit: 100, null: false
    t.string "cte", limit: 20
    t.string "danfe_cte", limit: 45
    t.string "string", limit: 45
    t.decimal "valor_receita", precision: 10, scale: 2, null: false
    t.decimal "valor_despesas", precision: 10, scale: 2, null: false
    t.decimal "valor_liquido", precision: 10, scale: 2, null: false
    t.text "observacao"
    t.integer "status", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "data_fechamento"
    t.decimal "qtde_volume", precision: 10, scale: 3
    t.decimal "peso", precision: 10, scale: 3
    t.integer "billing_id"
    t.date "data_entrega_servico"
    t.string "senha_sefaz", limit: 15
    t.integer "tipo", default: 0
    t.integer "carrier_id"
    t.integer "pallet_id"
    t.integer "billing_client_id"
    t.integer "delivery_driver_id"
    t.string "ordem_service_type", limit: 255
    t.integer "source_client_id"
    t.date "data_solicitacao"
    t.date "date_shipping"
    t.date "date_entry"
    t.date "lead_time"
    t.date "date_otif"
    t.integer "input_control_id"
    t.integer "carrier_entry_id"
    t.integer "direct_charge_id"
    t.time "hora_agendamento"
    t.integer "client_table_price_id"
    t.datetime "delivery_user_time"
    t.integer "delivery_user_id"
    t.index ["billing_id"], name: "index_ordem_services_on_billing_id"
    t.index ["client_table_price_id"], name: "index_ordem_services_on_client_table_price_id"
    t.index ["direct_charge_id"], name: "index_ordem_services_on_direct_charge_id"
    t.index ["driver_id"], name: "index_ordem_services_on_driver_id"
    t.index ["input_control_id"], name: "index_ordem_services_on_input_control_id"
    t.index ["target_client_id"], name: "index_ordem_services_on_target_client_id"
  end

  create_table "owners", id: :serial, force: :cascade do |t|
    t.string "cpf_cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.string "inscricao_estadual", limit: 20
    t.string "inscricao_municipal", limit: 20
    t.string "rg", limit: 20
    t.string "orgao_emissor", limit: 20
    t.date "data_emissao_rg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "obs"
  end

  create_table "ownerships", id: :serial, force: :cascade do |t|
    t.integer "vehicle_id"
    t.integer "owner_id"
    t.integer "ownership_id"
    t.string "ownership_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id"], name: "index_ownerships_on_owner_id"
    t.index ["vehicle_id"], name: "index_ownerships_on_vehicle_id"
  end

  create_table "pallets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.date "data_agendamento"
    t.integer "qtde"
    t.integer "status", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "qtde_informada"
    t.date "data_informada"
    t.date "data_fechamento"
    t.integer "billing_client_id"
    t.integer "carrier_id"
    t.index ["carrier_id"], name: "index_pallets_on_carrier_id"
    t.index ["client_id"], name: "index_pallets_on_client_id"
  end

  create_table "payment_methods", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "cpf_cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.integer "address_id", null: false
    t.string "numero", limit: 15, null: false
    t.string "complemento", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cpf_cnpj"], name: "index_people_on_cpf_cnpj", unique: true
  end

  create_table "phone_calls", id: :serial, force: :cascade do |t|
    t.string "nome", limit: 100, null: false
    t.string "telefone", limit: 50, null: false
    t.string "email", limit: 100, null: false
    t.decimal "valor", precision: 10, scale: 2
    t.integer "type_service_id", null: false
    t.text "assunto", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "status"
  end

  create_table "policie_insurances", id: :serial, force: :cascade do |t|
    t.integer "insurer_id"
    t.integer "broker_id"
    t.integer "type_policie"
    t.string "proposal", limit: 255
    t.string "policy", limit: 255
    t.date "date_start"
    t.date "date_expired"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["broker_id"], name: "index_policie_insurances_on_broker_id"
    t.index ["insurer_id"], name: "index_policie_insurances_on_insurer_id"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 255, null: false
    t.decimal "cubagem", precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "category_id"
    t.string "cod_prod", limit: 255
    t.string "ncm", limit: 255
    t.string "cest", limit: 255
    t.string "cfop", limit: 255
    t.string "ean", limit: 255
    t.string "unid_medida", limit: 255
    t.string "ean_trib", limit: 255
    t.string "unid_medida_trib", limit: 255
    t.decimal "valor_unitario", precision: 20, scale: 10
    t.decimal "width", precision: 10, scale: 3
    t.decimal "length", precision: 10, scale: 3
    t.decimal "height", precision: 10, scale: 3
    t.decimal "volume", precision: 10, scale: 2
    t.decimal "weight_liquid", precision: 10, scale: 2
    t.decimal "weight_gross", precision: 10, scale: 2
    t.decimal "ballast", precision: 10, scale: 2
    t.integer "factor"
    t.integer "box_by_pallet"
    t.integer "layer_pallet"
    t.integer "und_in_box"
    t.integer "family_id"
    t.string "ean_box", limit: 255
  end

  create_table "promoters", id: :serial, force: :cascade do |t|
    t.string "cpf", limit: 255
    t.string "nome", limit: 255
    t.string "fantasia", limit: 255
    t.string "endereco", limit: 255
    t.string "numero", limit: 255
    t.string "complemento", limit: 255
    t.string "bairro", limit: 255
    t.string "cidade", limit: 255
    t.string "estado", limit: 255
    t.string "cep", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "representatives", id: :serial, force: :cascade do |t|
    t.integer "tipo_pessoa", null: false
    t.string "cpf_cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "inscricao_estadual", limit: 20
    t.string "inscricao_municipal", limit: 20
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.string "rg", limit: 20
    t.string "orgao_emissor", limit: 20
    t.date "data_emissao"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "resource_id"
    t.string "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "schedulings", id: :serial, force: :cascade do |t|
    t.string "client", limit: 50
    t.string "type_modal", limit: 255
    t.date "date_scheduling"
    t.time "time_scheduling"
    t.date "date_scheduling_client"
    t.time "time_scheduling_client"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "container", limit: 255
    t.text "obs"
    t.date "free_time"
    t.integer "status", default: 0
    t.datetime "date_receipt_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_schedulings_on_user_id"
  end

  create_table "sealingwaxes", force: :cascade do |t|
    t.integer "sealing_id"
    t.string "sealing_type"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shippers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "cnpj", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 50, null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialty_employees", id: :serial, force: :cascade do |t|
    t.integer "specialty_id"
    t.integer "employee_id"
    t.decimal "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_specialty_employees_on_employee_id"
    t.index ["specialty_id"], name: "index_specialty_employees_on_specialty_id"
  end

  create_table "states", id: :serial, force: :cascade do |t|
    t.integer "code_uf"
    t.string "name", limit: 255
    t.string "uf", limit: 2
    t.integer "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["region_id"], name: "index_states_on_region_id"
  end

  create_table "stretch_routes", id: :serial, force: :cascade do |t|
    t.integer "stretch_source_id", null: false
    t.integer "stretch_target_id", null: false
    t.decimal "tax_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "decimal", precision: 10, scale: 2, default: "0.0"
    t.decimal "non_tax_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "secure_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "secure_rate_filch", precision: 10, scale: 2, default: "0.0"
    t.decimal "secure_rate_aggravated", precision: 10, scale: 2, default: "0.0"
    t.decimal "cost_kg", precision: 10, scale: 2, default: "0.0"
    t.decimal "tax_iss", precision: 10, scale: 2, default: "0.0"
    t.integer "travel_time"
    t.integer "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "pis_cofins", precision: 10, scale: 2, default: "0.0"
  end

  create_table "stretches", id: :serial, force: :cascade do |t|
    t.string "cidade", limit: 20
    t.string "estado", limit: 2
    t.string "destino", limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_cost_center_threes", id: :serial, force: :cascade do |t|
    t.integer "cost_center_id"
    t.integer "sub_cost_center_id"
    t.string "descricao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cost_center_id"], name: "index_sub_cost_center_threes_on_cost_center_id"
    t.index ["sub_cost_center_id"], name: "index_sub_cost_center_threes_on_sub_cost_center_id"
  end

  create_table "sub_cost_centers", id: :serial, force: :cascade do |t|
    t.integer "cost_center_id"
    t.string "descricao", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "type_service_id"
    t.index ["cost_center_id"], name: "index_sub_cost_centers_on_cost_center_id"
    t.index ["type_service_id"], name: "index_sub_cost_centers_on_type_service_id"
  end

  create_table "subject_answers", id: :serial, force: :cascade do |t|
    t.integer "subject_id"
    t.date "deadline"
    t.string "responsible", limit: 255
    t.text "action"
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["subject_id"], name: "index_subject_answers_on_subject_id"
  end

  create_table "subjects", id: :serial, force: :cascade do |t|
    t.integer "meeting_id"
    t.string "title", limit: 255
    t.time "time_meeting"
    t.string "responsible", limit: 255
    t.integer "created_user_id"
    t.integer "updated_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["meeting_id"], name: "index_subjects_on_meeting_id"
  end

  create_table "suppliers", id: :serial, force: :cascade do |t|
    t.string "cpf_cnpj", limit: 18, null: false
    t.string "nome", limit: 100, null: false
    t.string "fantasia", limit: 100, null: false
    t.string "inscricao_estadual", limit: 20
    t.string "inscricao_municipal", limit: 20
    t.string "endereco", limit: 100, null: false
    t.string "numero", limit: 20, null: false
    t.string "complemento", limit: 100
    t.string "bairro", limit: 100, null: false
    t.string "cidade", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "cep", limit: 10, null: false
    t.integer "tipo_pessoa", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "obs"
  end

  create_table "table_freights", id: :serial, force: :cascade do |t|
    t.integer "type_charge"
    t.integer "km_from"
    t.integer "km_to"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_icms", id: :serial, force: :cascade do |t|
    t.string "state_source", limit: 255
    t.string "state_target", limit: 255
    t.decimal "aliquot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_insurances", id: :serial, force: :cascade do |t|
    t.integer "insurer_id"
    t.string "state_source", limit: 255
    t.string "state_target", limit: 255
    t.decimal "percent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["insurer_id"], name: "index_table_insurances_on_insurer_id"
  end

  create_table "table_prices", id: :serial, force: :cascade do |t|
    t.integer "uf_tipo", null: false
    t.integer "tipo", null: false
    t.decimal "valor", precision: 10, scale: 2, null: false
    t.integer "table_price_id"
    t.string "table_price_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "employee_id"
    t.string "name", limit: 255
    t.text "body"
    t.date "start_date"
    t.date "finish_date"
    t.integer "time_first"
    t.integer "allocated"
    t.text "allocated_observation"
    t.integer "second_time"
    t.integer "status", null: false
    t.text "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date_finalization"
    t.integer "requester_id"
    t.integer "second_employee_id"
    t.index ["employee_id"], name: "index_tasks_on_employee_id"
  end

  create_table "tenants", id: :serial, force: :cascade do |t|
    t.string "subdomain", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_services", id: :serial, force: :cascade do |t|
    t.string "descricao", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tipo", default: 0
    t.index ["descricao"], name: "index_type_services_on_descricao", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "carrier_id"
    t.integer "client_id"
    t.integer "active"
    t.string "cpf", limit: 255
    t.string "name", limit: 255
    t.integer "employee_id"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "vehicle_restrictions", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.integer "motive_id"
    t.text "motive_observation"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_restrictions_on_vehicle_id"
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.string "marca", limit: 20, null: false
    t.string "modelo", limit: 20, null: false
    t.integer "ano", null: false
    t.string "cor", limit: 20, null: false
    t.integer "tipo_veiculo", null: false
    t.string "municipio_emplacamento", limit: 100, null: false
    t.string "estado", limit: 2, null: false
    t.string "renavan", limit: 20, null: false
    t.string "chassi", limit: 20, null: false
    t.string "capacidade", limit: 255, null: false
    t.string "placa", limit: 8, null: false
    t.string "especie", limit: 20, null: false
    t.integer "numero_eixos", null: false
    t.integer "numero_loks", null: false
    t.boolean "grade", null: false
    t.boolean "cordas", null: false
    t.boolean "lonas", null: false
    t.boolean "capacitacao", null: false
    t.boolean "kit_quimico", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "largura", precision: 10, scale: 2
    t.decimal "comprimento", precision: 10, scale: 2
    t.decimal "altura", precision: 10, scale: 2
    t.text "obs"
    t.integer "tipo"
    t.integer "tipo_carroceria"
    t.string "antt", limit: 255
    t.integer "qtde_paletes", default: 0, null: false
    t.integer "tipo_piso_assoalho"
    t.boolean "tracked", default: false
    t.decimal "capacity", precision: 10, scale: 2
    t.integer "user_id"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.integer "door"
    t.index ["user_created_id"], name: "index_vehicles_on_user_created_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["user_updated_id"], name: "index_vehicles_on_user_updated_id"
  end

  add_foreign_key "edi_queues", "nfe_keys"
  add_foreign_key "nfe_xmls", "carriers"
  add_foreign_key "people", "addresses", name: "people_address_id_fk"
  add_foreign_key "phone_calls", "type_services", name: "phone_calls_type_service_id_fk"
  add_foreign_key "vehicle_restrictions", "vehicles"
end
