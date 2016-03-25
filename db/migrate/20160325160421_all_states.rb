class AllStates < ActiveRecord::Migration
  def change
		execute <<-SQL
			INSERT INTO states (id, name, symbol, created_at, updated_at) VALUES
				(1, 'Acre', 'AC', now(), now()),
				(2, 'Alagoas', 'AL', now(), now()),
				(3, 'Amazonas', 'AM', now(), now()),
				(4, 'Amapá', 'AP', now(), now()),
				(5, 'Bahia', 'BA', now(), now()),
				(6, 'Ceará', 'CE', now(), now()),
				(7, 'Distrito Federal', 'DF', now(), now()),
				(8, 'Espírito Santo', 'ES', now(), now()),
				(9, 'Goiás', 'GO', now(), now()),
				(10, 'Maranhão', 'MA', now(), now()),
				(11, 'Minas Gerais', 'MG', now(), now()),
				(12, 'Mato Grosso do Sul', 'MS', now(), now()),
				(13, 'Mato Grosso', 'MT', now(), now()),
				(14, 'Pará', 'PA', now(), now()),
				(15, 'Paraíba', 'PB', now(), now()),
				(16, 'Pernambuco', 'PE', now(), now()),
				(17, 'Piauí', 'PI', now(), now()),
				(18, 'Paraná', 'PR', now(), now()),
				(19, 'Rio de Janeiro', 'RJ', now(), now()),
				(20, 'Rio Grande do Norte', 'RN', now(), now()),
				(21, 'Rondônia', 'RO', now(), now()),
				(22, 'Roraima', 'RR', now(), now()),
				(23, 'Rio Grande do Sul', 'RS', now(), now()),
				(24, 'Santa Catarina', 'SC', now(), now()),
				(25, 'Sergipe', 'SE', now(), now()),
				(26, 'São Paulo', 'SP', now(), now()),
				(27, 'Tocantins', 'TO', now(), now());
		SQL
  end
end
