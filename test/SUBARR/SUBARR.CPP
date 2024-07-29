#include <bits/stdc++.h>
#define N 500005
using namespace std;
int a[N], d1[N], d2[N];
int link[N];
int n;
long long sum = 0;

void sinhtest(int k)
{
    srand(time(0));
    freopen("SUBARR.INP","w",stdout);
    cout << k << endl;
    for (int i=1; i<=k; i++)
    {
        if (i % 100 == 1) cout << "-1 ";
        else if (i % 100 ==0) cout << "1 ";
             else cout << "0 ";
    }
}
int main()
{
    //sinhtest(500000);
    freopen("SUBARR.INP","r",stdin);
    freopen("SUBARR.OUT","w",stdout);
    cin >> n;
    for (int i=1; i<=n; i++)
    {
        cin >> a[i];
        sum += a[i];
    }
    if (sum % 3 != 0)
    {
        cout << 0;
        return 0;
    }
    sum = sum / 3;
    long long s = 0;
    for (int i=1;i<=n; i++)
    {
        s += a[i];
        if (s == sum) d1[i] = 1;
    }
    s = 0;
    for (int i=n; i>0; i--)
    {
        s += a[i];
        if (s == sum)
        {
            d2[i] = d2[i+1] + 1;
            link[i] = i;
        }
        else
        {
            d2[i] = d2[i+1];
            link[i] = link[i+1];
        }
    }
    s = 0;
    for (int i=1;i<=n-2; i++)
    if (d1[i] == 1)
        //s += d2[i+1] - 1;
        if (link[i+1] == i + 1) s+=d2[link[link[i+1]+1]];
        else    s += d2[link[i+1]];
    cout << s;
    return 0;
}
