package com.epam.rd.jsp.currencies;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

public class Currencies {
    private final Map<String, BigDecimal> curs = new TreeMap<>();

    public void addCurrency(String currency, BigDecimal weight) {
        curs.put(currency, weight);
    }

    public Collection<String> getCurrencies() {
        return new ArrayList<>(curs.keySet());
    }

    public Map<String, BigDecimal> getExchangeRates(String referenceCurrency) {
        BigDecimal refCurrencyValue = curs.get(referenceCurrency);
        return new TreeMap<>(curs.entrySet().stream()
                .collect(Collectors.toMap(Map.Entry::getKey,
                        currency -> refCurrencyValue.divide(currency.getValue(), 5, RoundingMode.HALF_UP))));
    }

    public BigDecimal convert(BigDecimal amount, String sourceCurrency, String targetCurrency) {
        BigDecimal sourceWeight = curs.get(sourceCurrency);
        BigDecimal targetWeight = curs.get(targetCurrency);
        return (sourceWeight.divide(targetWeight, 100, RoundingMode.HALF_UP).multiply(amount))
                .setScale(5, RoundingMode.HALF_UP);
    }
}