# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?

      show_spinner('Deletando banco', 'Apagou papai !') do
        `rails db:drop`
      end

      show_spinner('Criando banco', 'Criou papai !') do
        `rails db:create`
      end

      show_spinner('Migrando tabelas', 'Migrou papai !') do
        `rails db:migrate`
      end

      show_spinner('Populando banco', 'Populou papai !') do
        `rails db:seed`
      end

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
