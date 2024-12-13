for i in {1..1000}
do
   ./publish-prices.sh $(( RANDOM % 1001 ))
done
