#include <bits/stdc++.h>
#define N 100002
#define inf 9999999999999
#define ll long long
using namespace std;
ll a[N], b[N];
int n,m,w,h;
int main()
{
    freopen("bonus.inp","r",stdin);
    freopen("bonus.out","w",stdout);
    cin >> m >> n >> w >> h;
    for (int i=1; i<=m; i++)
    {
        cin >> a[i];
        a[i] = a[i] * (h * 1LL);
        a[i] += a[i-1];
    }
    for (int i=1; i<=n; i++)
    {
        cin >> b[i];
        b[i] = b[i] * (w * 1LL);
        b[i] += b[i-1];
    }
    ll suma = -inf, sumb = -inf;
    for (int i=w; i<=m; i++)
        suma = max(suma,a[i] - a[i-w]);
    for (int i=h; i<=n; i++)
        sumb = max(sumb,b[i] - b[i-h]);
    cout << suma + sumb;
    return 0;
}
