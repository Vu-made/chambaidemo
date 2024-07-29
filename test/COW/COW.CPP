#include <bits/stdc++.h>
#define pii pair<int,int>
#define ll long long
#define N 100005
using namespace std;
pii a[N];
int n,d;
ll Smax = 0;
int main()
{
    freopen("COW.INP","r",stdin);
    freopen("COW.OUT","w",stdout);
    cin >> n >> d;
    for (int i=1;i<=n; i++) cin >> a[i].first >> a[i].second;
    sort(a+1,a+n+1);
    int i = 1, j = 2;
    ll S = Smax = a[1].second;
    while (i <= j && j <= n)
    {
        if (a[j].first - a[i].first <= d)
        {
            S += a[j++].second;
            Smax = max(Smax,S);
        }
        else S -= a[i++].second;
    }
    cout << Smax;
    return 0;
}
