function invM = compute_invM_by_formula(A, B, C, Q1, Q2)

    [m, n] = size(B);
    [p, ~] = size(C);

   A0 = A + B' / Q1 * B;
   C0 = [C / Q1 * B, zeros(p,m)];
   Q12 = Q1 + C' /Q2 * C;
   M0 = [A0, B'; B, Q12];
   S1 = -Q12 + B / A0 * B';
   S2 = -Q2 + C0 / M0 * C0';

   invM11 = -(A0^(-1)*B'/Q1*C'/S2*C/Q1*B-A0^(-1)*B'/S1*B/A0*B'/Q1*C'/S2*C/Q1*B)*(A0^(-1)-A0^(-1)*B'/S1*B/A0)+(A0^(-1)-A0^(-1)*B'/S1*B/A0);
   invM12 = -(A0^(-1)*B'/Q1*C'/S2*C/Q1*B-A0^(-1)*B'/S1*B/A0*B'/Q1*C'/S2*C/Q1*B)/A0*B'/S1 + A0^(-1)*B'/S1;
   invM21 = -S1^(-1)*B/A0*B'/Q1*C'/S2*C/Q1*B*(A0^(-1)-A0^(-1)*B'/S1*B/A0) + S1^(-1)*B/A0;
   invM22 = -S1^(-1)*B/A0*B'/Q1*C'/S2*C/Q1*B/A0*B'/S1 - S1^(-1);

   invM13 = A0^(-1)*B'/Q1*C'/S2 - A0^(-1)*B'/S1*B/A0*B'/Q1*C'/S2;
   invM23 = (S1^(-1)*B/A0*B'/Q1*C'/S2);

   invM31 = S2^(-1)*C/Q1*B/A0 - S2^(-1)*C/Q1*B/A0*B'/S1*B/A0;
   invM32 = S2^(-1)*C/Q1*B/A0*B'/S1;

   invM33 = -S2^(-1);

    % Get M
   invM = [invM11, invM12, invM13; 
       invM21, invM22, invM23;
       invM31, invM32, invM33];
end