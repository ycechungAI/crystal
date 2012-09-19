require 'spec_helper'

describe 'Code gen: primitives' do
  it 'codegens bool' do
    run('true').to_b.should be_true
  end

  it 'codegens int' do
    run('1').to_i.should eq(1)
  end

  it 'codegens float' do
    run('1; 2.5').to_f.should eq(2.5)
  end

  it 'codegens char' do
    run("'a'").to_i.should eq(?a.ord)
  end

  it 'codegens int method' do
    run('class Int; def foo; 3; end; end; 1.foo').to_i.should eq(3)
  end

  it 'codegens int method with clashing name in global scope' do
    run('def foo; 5; end; class Int; def foo; 2; end; end; 1.foo; foo').to_i.should eq(5)
  end

  it 'codegens Int + Int' do
    run('1 + 2').to_i.should eq(3)
  end

  it 'codegens Int - Int' do
    run('1 - 2').to_i.should eq(-1)
  end

  it 'codegens Int * Int' do
    run('2 * 3').to_i.should eq(6)
  end

  it 'codegens Int == Int gives false' do
    run('1 == 2').to_b.should eq(false)
  end

  it 'codegens Int == Int gives true' do
    run('1 == 1').to_b.should eq(true)
  end

  it 'codegens Int != Int gives false' do
    run('1 != 1').to_b.should eq(false)
  end

  it 'codegens Int != Int gives true' do
    run('1 != 2').to_b.should eq(true)
  end

  it 'codegens Int < Int gives false' do
    run('2 < 1').to_b.should eq(false)
  end

  it 'codegens Int < Int gives true' do
    run('1 < 2').to_b.should eq(true)
  end

  it 'codegens Int <= Int gives false' do
    run('2 <= 1').to_b.should eq(false)
  end

  it 'codegens Int <= Int gives true' do
    run('1 <= 1').to_b.should eq(true)
    run('1 <= 2').to_b.should eq(true)
  end

  it 'codegens Int > Int gives false' do
    run('1 > 2').to_b.should eq(false)
  end

  it 'codegens Int > Int gives true' do
    run('2 > 1').to_b.should eq(true)
  end

  it 'codegens Int >= Int gives false' do
    run('1 >= 2').to_b.should eq(false)
  end

  it 'codegens Int >= Int gives true' do
    run('1 >= 1').to_b.should eq(true)
    run('2 >= 1').to_b.should eq(true)
  end
end
