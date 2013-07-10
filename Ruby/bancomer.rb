#!/usr/bin/env ruby

require_relative 'account'

account = Account.new(1, 'Ahorro', 'bancomer.sqlite')

fields = Hash.new

fields['MovimientoECB'] = {
    'fecha' => 'date', 
    'referencia' => 'chknum',
    'descripcion' => 'memo',  
    'importe' => 'amount', 
    'moneda' => 'currencycode',
    'saldoInicial' => nil, 
    'saldoAlCorte' => nil
}

fields['MovimientoECBFiscal'] = {
    'fecha' => 'date', 
    'referencia' => 'chknum', 
    'descripcion' => 'memo',
    'RFCenajenante' => nil, 
    'Importe' => 'amount', 
    'moneda' => 'currencycode',
    'saldoInicial' => nil, 
    'saldoAlCorte' => nil
}


account.transactions.load_xml('Enero.xml', fields)
account.transactions.load_xml('Febrero.xml', fields)

print account.transactions.to_s

