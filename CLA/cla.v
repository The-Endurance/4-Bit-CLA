module cla(a, b, s, cin, cout);

    input [3:0] a;
    input [3:0] b;
    input cin;
    
    output cout;
    output [3:0] s;

    //Gs

    and(g0, a[0], b[0]);
    and(g1, a[1], b[1]);
    and(g2, a[2], b[2]);
    and(g3, a[3], b[3]);

    //Ps

    xor(p0, a[0], b[0]);
    xor(p1, a[1], b[1]);
    xor(p2, a[2], b[2]);    
    xor(p3, a[3], b[3]);

    //Cs

    and(p0cin,p0,cin);
    or(c1,p0cin,g0);

    and(p1p0cin,p1,p0,cin);
    and(p1g0,p1,g0);
    or(c2,g1,p1g0,p1p0cin);

    and(p2p1p0cin,p2,p1,p0,cin);
    and(p2p1g0,p2,p1,g0);
    and(p2g1,p2,g1);
    or(c3,p2p1p0cin,p2p1g0,p2g1,g2);

    and(p3p2p1p0cin,p3,p2,p1,p0,cin);
    and(p3p2p1g0,p3,p2,p1,g0);
    and(p3p2g1,p3,p2,g1);
    and(p3g2,p3,g2);
    or(cout,p3p2p1p0cin,p3p2p1g0,p3p2g1,p3g2,g3);

    //Ss

    xor(s[0], p0, cin);
    xor(s[1], p1, c1);    
    xor(s[2], p2, c2);
    xor(s[3], p3, c3);

endmodule
