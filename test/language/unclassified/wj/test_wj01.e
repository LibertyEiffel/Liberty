class TEST_WJ01
-- From: Gabriel Weiﬂelberg <gabriel.weisselberg@brokat-le.com>
creation make

feature

  make is
    do
      !!a.make("a");
      !!c;
      if c.output(a) /= Void then end;
    end

  a: AUX_WJ01A1;
  c: AUX_WJ01C1;

end

