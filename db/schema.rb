# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110219170906) do

  create_table "ators", :force => true do |t|
    t.string   "nome"
    t.string   "nacionalidade"
    t.date     "data_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ators_copias", :force => true do |t|
    t.integer "ator_id"
    t.integer "copia_id"
  end

  create_table "copias", :force => true do |t|
    t.string   "titulo"
    t.integer  "duracao"
    t.string   "ano"
    t.integer  "genero_id"
    t.integer  "diretor_id"
    t.date     "aquisicao"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diretors", :force => true do |t|
    t.string   "nome"
    t.string   "nacionalidade"
    t.date     "data_nascimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprestimos", :force => true do |t|
    t.date     "data_emprestimo"
    t.date     "data_devolucao"
    t.float    "valor"
    t.integer  "copia_id"
    t.integer  "socio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socios", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
