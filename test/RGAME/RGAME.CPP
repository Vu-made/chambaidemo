#include <bits/stdc++.h>
#define N 105
using namespace std;
int Next[N], Pre[N];
int n, k, s;
int main()
{
    freopen("RGAME.INP","r",stdin);
    freopen("RGAME.OUT","w",stdout);
    cin >> n >> s;
    cin >> k;
    for (int i=1;i<=n;i++)
    {
        Next[i] = i+1;
        Pre[i] = i - 1;
    }
    Next[n] = 1; Pre[1] = n;
    int d = 1, p = 1;
    int m = n;
    while (n > 1)
    {
        while (d < s)
        {
            d++;
            p = Next[p];
        }
        Next[Pre[p]] = Next[p];
        Pre[Next[p]] = Pre[p];
        n--;
        d=1;
        p = Next[p];
    }
    cout << p << endl;
    if (p <= k) cout << 1 + k - p;
    else cout << m + k - p + 1;
    return 0;
}
