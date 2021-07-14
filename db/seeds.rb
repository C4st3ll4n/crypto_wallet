puts "Cadastrando as moeditas"
Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://img1.gratispng.com/20171220/shw/bitcoin-png-5a3a270236e2a5.49737455151376051422485643.jpg"
)

Coin.create!(
  description: "Etherium",
  acronym: "ETH",
  url_image: "https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg"
)

Coin.create!(
  description: "Dash",
  acronym: "DSH",
  url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png"
)
puts "Cadastrado as moeditas"