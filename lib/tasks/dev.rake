# frozen_string_literal: true

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?

      show_spinner('Deletando banco', 'Apagou papai !') { `rails db:drop` }

      show_spinner('Criando banco', 'Criou papai !') { `rails db:create` }

      show_spinner('Migrando tabelas', 'Migrou papai !') { `rails db:migrate` }

      `rails dev:add_mining_types`

      `rails dev:add_coins`
    else
      puts 'Não está em dev !'
    end
  end

  private

  # @param [String] _title
  # @param [String] _done
  def show_spinner(_title, _done)
    spinner = TTY::Spinner.new("[:spinner] #{_title} ...")
    spinner.auto_spin
    yield
    spinner.success("(#{_done})") # Stop animation
  end

  desc "Cadastra algumas moedas no banco de dados"
  task add_coins: :environment do

    coins = [
      {
        description: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'https://img1.gratispng.com/20171220/shw/bitcoin-png-5a3a270236e2a5.49737455151376051422485643.jpg',
        mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
        description: 'Etherium',
        acronym: 'ETH',
        url_image: 'https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg',
        mining_type: MiningType.find_by(acronym: 'PoS')
      },
      {
        description: 'Dash',
        acronym: 'DSH',
        url_image: 'https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png',
        mining_type: MiningType.find_by(acronym: 'PoC')
      }
    ]

    coins.each do |coin|
      show_spinner("Criando moeda #{coin.values[0]}", 'Concluído com sucesso') { Coin.find_or_create_by!(coin) }
    end

  end

  desc "Cadastra alguns tipos de minerações no banco de dados"
  task add_mining_types: :environment do

    mining_types = [{ description: 'Proof of Work', acronym: 'PoW' }, { description: 'Proof of Stake', acronym: 'PoS' },
                    { description: 'Proof of Capacity', acronym: 'PoC' },]

    mining_types.each { |mt| show_spinner("Criando #{mt.values[0]}", 'Feito !') { MiningType.find_or_create_by(mt) } }
  end
end


