import { Amplify} from 'aws-amplify';
import { generateClient } from 'aws-amplify/api';
import config from './aws-exports.js';
import * as queries from './graphql/queries';
Amplify.configure(config);

const client = generateClient();




const allQueries = await client.graphql({query: queries.listEthAppsyncs});
allQueries.data.listEthAppsyncs.items.forEach((element) => console.log(element)); 

// Run with "npm start"