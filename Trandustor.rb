puts "Digite um numero romano:"
roman = gets.chomp.upcase

i = 0
total = 0
estado = "q0"

ultimo_simbolo = ""
contador = 0
ultimo_valor = 4000
puts "-----------------------"

while i < roman.length

  simbolo = roman[i]

  if simbolo == ultimo_simbolo
    contador = contador + 1
  else
    contador = 1
  end

  ultimo_simbolo = simbolo

  if simbolo == "V" or simbolo == "L" or simbolo == "D"
    if contador > 1
      puts "ERRO: #{simbolo} nao pode repetir"
      exit
    end
  end

  if contador > 3
    puts "ERRO: #{simbolo} repetido mais de 3 vezes"
    exit
  end


  if simbolo == "I"
    valor = 1
  elsif simbolo == "V"
    valor = 5
  elsif simbolo == "X"
    valor = 10
  elsif simbolo == "L"
    valor = 50
  elsif simbolo == "C"
    valor = 100
  elsif simbolo == "D"
    valor = 500
  elsif simbolo == "M"
    valor = 1000
  else
    puts "ERRO: simbolo invalido"
    exit
  end

  estado_anterior = estado
  estado = "q#{simbolo}"

  if i + 1 < roman.length

    prox = roman[i+1]

    if prox == "I"
      prox_valor = 1
    elsif prox == "V"
      prox_valor = 5
    elsif prox == "X"
      prox_valor = 10
    elsif prox == "L"
      prox_valor = 50
    elsif prox == "C"
      prox_valor = 100
    elsif prox == "D"
      prox_valor = 500
    elsif prox == "M"
      prox_valor = 1000
    end


    if valor < prox_valor

      valido = false

      if simbolo == "I" and (prox == "V" or prox == "X")
        valido = true
      end

      if simbolo == "X" and (prox == "L" or prox == "C")
        valido = true
      end

      if simbolo == "C" and (prox == "D" or prox == "M")
        valido = true
      end

      if valido == false
        puts "ERRO: numero romano invalido"
        exit
      end

      saida = prox_valor - valor

      if saida > ultimo_valor
        puts "ERRO: ordem invalida"
        exit
      end

      ultimo_valor = saida
      total = total + saida

      puts "#{estado_anterior} --#{simbolo}--> #{estado} | saida: #{saida} (subtracao)"

      i = i + 2
      next
    end
  end


  if valor > ultimo_valor
    puts "ERRO: ordem invalida"
    exit
  end

  ultimo_valor = valor
  total = total + valor

  puts "#{estado_anterior} --#{simbolo}--> #{estado} | saida: #{valor}"

  i = i + 1

end

puts
puts "RESULTADO DECIMAL: #{total}"
