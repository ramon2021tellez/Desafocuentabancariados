#Ejercicio 1
# 1 crear las clases Usuario y CuentaBancaria
class Usuario
    attr_accessor :cuenta
    def initialize (nombre, cuenta)
        @nombre = nombre
        @cuenta = cuenta

    end
    #suma de saldo total
    def saldo_total
        saldo= 0
        self.cuenta.each do |i|
            saldo+= i.saldo
        end
        return saldo
    end
    
end


class CuentaBancaria
    attr_accessor :saldo, :numero_cuenta
    def initialize(banco,numero_cuenta,saldo=0)
        @banco= banco
        @numero_cuenta = numero_cuenta
        @saldo = saldo
    end
    
    def transferir (monto, otra_cuenta)
        self.saldo -= monto
        otra_cuenta.saldo += monto
    end
    
end

#probar creando dos cuentas cada una con un saldo de 5000

cuentaitau = CuentaBancaria.new('Itau', 15484565, 5000)
cuentaestado = CuentaBancaria.new('Estado', 12545652, 5000)

#transferir a otra cuenta 
puts cuentaitau.transferir(500,cuentaestado)

#creando un nuevo usario
nuevousuario = Usuario.new('Juan Perez', [cuentaitau])
puts nuevousuario
#saldo total
total = nuevousuario.saldo_total
puts "Juan Perez su saldo total es: #{total}"