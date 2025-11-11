exports.handler = async (event) => {
  const AWS = require("aws-sdk");
  const s3 = new AWS.S3();

  await s3.putObject({
    Bucket: "my-eventbridge-logs",
    Key: `event-${Date.now()}.json`,
    Body: JSON.stringify(event, null, 2),
  }).promise();

  return { status: "Event saved to S3" };
};
