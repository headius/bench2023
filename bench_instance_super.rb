require 'benchmark/ips'

class Foo
  def foo; 1; end
end

class Bar < Foo
  def foo; super; end
end

class Baz < Bar
  def foo; super; end
end

Benchmark.ips do |b|
  baz = Baz.new
  b.report("instance super") do
    bz = baz
    i = 0
    while i < 1000
      bz.foo
      bz.foo
      bz.foo
      bz.foo
      bz.foo
      i+=1
    end
  end
end
