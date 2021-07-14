# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?

      show_spinner('Deletando banco', 'Apagou papai !') { `rails db:drop` }

      show_spinner('Criando banco', 'Criou papai !') { `rails db:create` }

      show_spinner('Migrando tabelas', 'Migrou papai !') { `rails db:migrate` }

      show_spinner('Populando banco', 'Populou papai !') { `rails db:seed` }

    else
      puts 'Não está em dev !'
    end
  end

  def show_spinner(_title, _done)
    spinner = TTY::Spinner.new("[:spinner] #{_title} ...")
    spinner.auto_spin
    yield
    spinner.success("(#{_done})") # Stop animation
  end
end
