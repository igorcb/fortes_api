class Driver < ApplicationRecord
  validates :cpf, presence: true, uniqueness: true, length: { maximum: 14 }
  validates :nome, presence: true, length: { maximum: 100 }
  validates :fantasia, presence: true, length: { maximum: 100 }
  validates :cep, presence: true, length: { maximum: 10 }
  validates :endereco, presence: true, length: { maximum: 100 }
  validates :numero, presence: true, length: { maximum: 15 }
  validates :complemento, length: { maximum: 100 }
  validates :bairro, presence: true, length: { maximum: 100 }
  validates :cidade, presence: true, length: { maximum: 100 }
  validates :estado, presence: true, length: { maximum: 2 }
  validates :rg, presence: true, length: { maximum: 20 }
  validates :orgao_expeditor, presence: true, length: { maximum: 20 }
  validates :data_emissao_rg, presence: true
  validates :data_nascimento, presence: true
  validates :municipio_nascimento, presence: true, length: { maximum: 100 }
  validates :estado_nascimento, presence: true, length: { maximum: 2 }
  validates :estado_civil, presence: true
  validates :cor_da_pele, presence: true
  validates :tipo_contrato, presence: true
  validates :inss, presence: true, length: { maximum: 20 }
  validates :cnh, presence: true, length: { maximum: 20 }
  validates :registro_cnh, presence: true,length: { maximum: 20 }
  validates :validade_cnh, presence: true
  validates :categoria, presence: true, :numericality => { :only_integer => true }, inclusion: { in: 0..8 }
  validates :nome_do_pai, presence: true, length: { maximum: 100 }
  validates :nome_da_mae, presence: true, length: { maximum: 100 }

  validate  :expiration_validade_cnh

  belongs_to :user_created, class_name: "User", foreign_key: "user_created_id", required: false
  belongs_to :user_updated, class_name: "User", foreign_key: "user_updated_id", required: false

  def expiration_validade_cnh
    if cnh_expired?
      errors.add(:validade_cnh, "expiration")
    end
  end

  def cnh_expired?
    validade_cnh.present? && validade_cnh < Date.today
  end
end
