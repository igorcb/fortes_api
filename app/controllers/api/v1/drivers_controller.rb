class Api::V1::DriversController < Api::V1::ApiController
  before_action :set_driver, only: [:show, :update]
  before_action :require_authorization!, only: [:show, :update]

  # GET /api/v1/drivers
   def index
     @drivers = Driver.where(sync: false).order(:id)
     render json: @drivers
   end

   def show
     render json: @driver
   end

   def create
     @driver = Driver.new(driver_params.merge(user_created: current_user))
     if @driver.save
       render json: @driver, status: :created
     else
       render json: @driver.errors, status: :unprocessable_entity
     end
   end

  # PATCH/PUT /api/v1/drivers/1
  def update
    if @driver.update(driver_params.merge(user_updated: current_user))
      render json: @driver
    else
      render json: @driver.errors, status: :unprocessable_entity
    end
  end

  def find_by_cpf
    @driver = Driver.where(cpf: params[:cpf]).first
    render json: @driver
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def driver_params
      params.require(:driver).permit(:cpf, :nome, :fantasia, :inscricao_estadual, :instricao_municipal, :endereco, :numero, :complemento,
        :bairro, :cidade, :estado, :cep, :rg, :data_emissao_rg, :orgao_expeditor, :obs, :data_nascimento, :municipio_nascimento,
        :estado_nascimento, :tipo_contrato, :estado_civil, :cor_da_pele, :inss, :cnh, :registro_cnh, :categoria, :validade_cnh, :nome_do_pai,
        :nome_da_mae, :sync)
    end

    def require_authorization!
      # unless current_user == @driver.user
      #   render json: {}, status: :forbidden
      # end
   end

end
