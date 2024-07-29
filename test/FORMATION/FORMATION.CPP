#include <bits/stdc++.h>
#define N 1000001
using namespace std;
int L[N], R[N];
int n, m;
void xuly1()
{
    int i,j;
    cin >> i >> j;
    L[i] = L[j];
    R[i] = j;
    R[L[j]] = i;
    L[j] = i;
}

void xuly2()
{
    int i,j;
    cin >> i >> j;
    L[i] = j;
    R[i] = R[j];
    L[R[j]] = i;
    R[j] = i;
}

void xuly3()
{
    int i;
    cin >> i;
    R[L[i]] = R[i];
    L[R[i]] = L[i];
}

void xuly4()
{
    int i;
    cin >> i;
    cout << L[i] << ' ' << R[i] << endl;
}
int main()
{
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    freopen("FORMATION.INP","r",stdin);
    freopen("FORMATION.OUT","w",stdout);
    cin >> n >> m;
    for (int i=1; i<=m; i++)
    {
        int k;
        cin >> k;
        if (k == 1) xuly1();
        else if (k==2) xuly2();
        else if (k==3) xuly3();
        else xuly4();
    }
    return 0;
}
