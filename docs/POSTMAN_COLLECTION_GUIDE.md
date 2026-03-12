# RustChain Postman Collection Guide

## Overview

This Postman Collection provides a complete set of API requests for testing and interacting with the RustChain blockchain platform. The collection is generated from the official OpenAPI 3.0 specification and includes pre-configured tests, environment variables, and authentication setup.

## Installation

### Step 1: Import the Collection

1. Open Postman
2. Click **Import** (top left)
3. Select `RustChain_Postman_Collection.json`
4. Click **Import**

### Step 2: Configure Environment Variables

The collection uses the following variables:

| Variable | Default Value | Description |
|----------|--------------|-------------|
| `base_url` | `https://api.rustchain.org/v1` | Production API endpoint |
| `testnet_url` | `https://testnet-api.rustchain.org/v1` | Testnet API endpoint |
| `api_key` | (empty) | Your API key for authenticated requests |
| `wallet_address` | (empty) | Wallet address for balance/transaction queries |
| `block_number` | `1` | Block number for block queries |
| `limit` | `20` | Pagination limit for list endpoints |
| `offset` | `0` | Pagination offset for list endpoints |

### Step 3: Set Up Authentication

The collection supports two authentication methods:

#### API Key Authentication (Default)
- Header: `X-API-Key: {{api_key}}`
- Set your API key in the `api_key` environment variable

#### Bearer Token Authentication
- Header: `Authorization: Bearer <JWT_TOKEN>`
- Replace the auth type in specific requests as needed

## Collection Structure

### 📁 System
System health and status endpoints.

- **Health Check** - Verify node health and version
  - Method: `GET /health`
  - Response: Status, version, timestamp

### 📁 Blockchain
Blockchain data endpoints.

- **Get Current Epoch** - Retrieve current epoch information
  - Method: `GET /epoch`
  - Response: Epoch number, block height, timestamp

- **Get Block by Number** - Fetch specific block details
  - Method: `GET /block/{block_number}`
  - Parameters: `block_number` (path)
  - Response: Block hash, transactions, miner info

### 📁 Mining
Mining-related endpoints.

- **List Miners** - Get active miners on the network
  - Method: `GET /api/miners`
  - Parameters: `limit`, `offset` (query)
  - Response: Array of miners with address, hashrate, blocks mined

### 📁 Wallet
Wallet and transaction endpoints.

- **Get Wallet Balance** - Check wallet balance
  - Method: `GET /wallet/balance`
  - Parameters: `address` (query, required)
  - Response: Balance in RTC and wei

- **List Transactions** - Get transaction history
  - Method: `GET /transactions`
  - Parameters: `address` (required), `limit` (query)
  - Response: Array of transactions with hash, from, to, value, timestamp

### 📁 Attestation
Attestation-related endpoints.

- **Submit Attestation** - Submit new attestation to network
  - Method: `POST /attest/submit`
  - Body: JSON with `data` and `signature`
  - Response: Transaction hash and status

## Usage Examples

### Example 1: Check Node Health

```bash
curl -X GET "https://api.rustchain.org/v1/health"
```

Expected Response:
```json
{
  "status": "healthy",
  "version": "1.0.0",
  "timestamp": 1640000000
}
```

### Example 2: Get Wallet Balance

1. Set `wallet_address` variable to your wallet address
2. Send request to **Get Wallet Balance**
3. View balance in RTC and wei

### Example 3: Submit Attestation

1. Prepare your attestation data and signature
2. Update the request body with your data:
```json
{
  "data": {
    "type": "your_attestation_type",
    "payload": "your_payload"
  },
  "signature": "0x_your_signature"
}
```
3. Send POST request
4. Receive transaction hash

## Automated Tests

Each request includes built-in test scripts that validate:
- ✅ HTTP status code (200)
- ✅ Required response fields exist
- ✅ Data type correctness
- ✅ Expected value ranges

### Running Tests

1. Select the collection or folder
2. Click **Runner** (bottom left)
3. Configure iterations and delay
4. Click **Run**

### Test Results

Tests will show:
- ✅ Passed tests (green)
- ❌ Failed tests (red)
- ⏱️ Response times
- 📊 Response sizes

## Environment Switching

### Production
```json
{
  "base_url": "https://api.rustchain.org/v1"
}
```

### Testnet
```json
{
  "base_url": "https://testnet-api.rustchain.org/v1"
}
```

To switch environments:
1. Click environment selector (top right)
2. Choose **Production** or **Testnet**
3. Variables update automatically

## Troubleshooting

### Issue: 401 Unauthorized
**Solution:** Set your API key in the `api_key` variable

### Issue: 404 Not Found
**Solution:** 
- Verify `base_url` is correct
- Check that the endpoint path matches the API version

### Issue: 400 Bad Request
**Solution:**
- Verify required parameters are set
- Check request body JSON syntax
- Ensure wallet addresses are valid format

### Issue: Tests Failing
**Solution:**
- Check response structure matches expected schema
- Verify API endpoint is returning valid JSON
- Review test script for custom validation logic

## Advanced Usage

### Collection Variables

Use collection variables for dynamic values:
```javascript
// In pre-request script
pm.collectionVariables.set("last_block", pm.response.json().number);
```

### Chaining Requests

Use response data in subsequent requests:
```javascript
// In test script
var jsonData = pm.response.json();
pm.collectionVariables.set("tx_hash", jsonData.tx_hash);
```

### Custom Test Scripts

Add custom validations in the **Tests** tab:
```javascript
pm.test("Balance is positive", function () {
    var jsonData = pm.response.json();
    pm.expect(parseFloat(jsonData.balance)).to.be.above(0);
});
```

## API Reference

For complete API documentation, see:
- [OpenAPI Specification](./openapi.yaml)
- [API Reference](./API_REFERENCE.md)

## Support

- **Issues:** https://github.com/Scottcjn/rustchain-bounties/issues
- **Documentation:** https://rustchain.org/docs
- **Community:** Discord/Telegram channels

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-03-13 | Initial release from OpenAPI 3.0 spec |

## License

MIT License - See [LICENSE](../LICENSE) for details.

---

**Generated from OpenAPI 3.0 Specification**  
**Compatible with Postman v8.0+**
