require 'rbvmomi'

describe 'EmitRequest' do
  MO = RbVmomi::VIM::VirtualMachine(nil, "foo")

  def emit( builder, root, description, vm, params)
    soap = RbVmomi::VIM.new(:ns => 'urn:vim25', :rev => '4.0')
    soap.emit_request( builder, root, description, vm, params)
    builder.target!
  end

  let(:builder){ Builder::XmlMarkup.new( :indent => 2) }
  it 'should emit xml' do
    description = [{'name'        => 'blah',
                    'is-array'    => true,
                    'is-optional' => true,
                    'wsdl_type'   => 'xsd:string',}]
    xml = <<EOS
<root xmlns="urn:vim25">
  <_this type="VirtualMachine">foo</_this>
  <blah>a</blah>
  <blah>b</blah>
  <blah>c</blah>
</root>
EOS

    output = emit( builder, 'root', description, MO, blah: ['a','b','c'] )
    expect(output).to eql(xml.to_s)
    expect(builder.class).to eql('what')
    expect(builder.xpath('//blah')).to eql('what')
  end



end
